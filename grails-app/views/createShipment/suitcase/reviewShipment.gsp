                                            
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="custom" />
         <title>Review Shipment</title>         
    </head>
    <body>
       
        <div class="body">
           
			<g:if test="${message}">
				<div class="message">${message}</div>
			</g:if>
			<g:hasErrors bean="${shipmentInstance}">
				<div class="errors">
					<g:renderErrors bean="${shipmentInstance}" as="list" />
				</div>
			</g:hasErrors>
           
									
           
			<g:form action="suitcase" method="post" >
           		<g:hiddenField name="id" value="${shipmentInstance?.id}"/>
           		<fieldset>
           			<legend>Step 4. Review shipment</legend>
           		
           			<g:render template="flowHeader" model="['currentState':'Review']"/>
           			
					<div class="dialog">     
						<h2>Please review your shipment details:</h2>
						<table>
							<tbody>
								<tr class="prop">
									<td valign="top" class="name"><label><g:message
										code="shipment.name.label" default="Shipment Number" /></label>
									</td>
									<td colspan="3" valign="top"
										class="value ${hasErrors(bean: shipmentInstance, field: 'name', 'errors')}">
										<span style="line-height: 1.5em">${shipmentInstance?.shipmentNumber}</span>
									</td>
								</tr>
								<tr class="prop">
									<td valign="middle" class="name"><label><g:message
										code="shipment.shipmentType.label" default="Type" /></label></td>
									<td valign="middle" class="value" nowrap="nowrap">
										<g:hiddenField name="shipmentType.id" value="${shipmentInstance?.shipmentType?.id}"/>
										${shipmentInstance?.shipmentType?.name}								
		
									</td>
								</tr>			
								<tr class="prop">
									<td valign="top" class="name"><label><g:message
										code="shipment.name.label" default="Name" /></label>
									</td>
									<td colspan="3" valign="top"
										class="value ${hasErrors(bean: shipmentInstance, field: 'name', 'errors')}">
										${shipmentInstance?.name}
									</td>
								</tr>									
								<tr class="prop">
									<td valign="top" class="name"><label>Origin</label></td>
									<td valign="top" class="value">
										${shipmentInstance?.origin?.name}
									</td>
								</tr>
								<tr class="prop">
									<td valign="top" class="name"><label>Destination</label></td>
									<td valign="top" class="value">
										${shipmentInstance?.destination?.name}
									</td>
								</tr>
								<tr class="prop">
									<td valign="top" class="name" style="width: 10%;"><label><g:message
										code="shipment.traveler.label" default="Traveler" /></label></td>
									<td valign="top" style="width: 30%;">
										${shipmentInstance?.carrier?.name}
											
									</td>
								</tr>							
								<tr class="prop">
									<td valign="top" class="name"><label><g:message
										code="shipment.expectedShippingDate.label" default="Expected shipping date" /></label></td>
									<td valign="top"
										class=" ${hasErrors(bean: shipmentInstance, field: 'expectedShippingDate', 'errors')}"
										nowrap="nowrap">
											<g:formatDate date="${shipmentInstance?.expectedShippingDate}" format="MMM dd, yyyy"/>
									</td>
								</tr>		
								<tr class="prop">
									<td valign="top" class="name"><label><g:message
										code="shipment.expectedShippingDate.label" default="Expected arrival date" /></label></td>
									<td valign="top"
										class=" ${hasErrors(bean: shipmentInstance, field: 'expectedDeliveryDate', 'errors')}"
										nowrap="nowrap">
											<g:formatDate date="${shipmentInstance?.expectedDeliveryDate}" format="MMM dd, yyyy"/>
									</td>
								</tr>		
								
								
								<tr class="prop">
									<td valign="top" class="name"><label><g:message
										code="shipment.totalValue.label" default="Total Value (USD)" /></label></td>
									<td valign="top"
										class=" ${hasErrors(bean: shipmentInstance, field: 'totalValue', 'errors')}"
										nowrap="nowrap">
										<g:if test="${shipmentInstance?.totalValue}">
											USD $<g:formatNumber number="${shipmentInstance?.totalValue}" format="###,##0.00"/>
										</g:if>
									</td>
								</tr>									
								<tr class="prop">
									<td class="name"><label>Suitcase Letter</label></td>
									<td class="value">
										<img src="${createLinkTo(dir: 'images/icons/silk', file: 'email_open.png') }" style="vertical-align:middle"> &nbsp;
										<g:link action="suitcase" event="reviewLetter">view letter</g:link>					
									</td>
								</tr>
								
								<tr class="prop">
									<td colspan="2">
										<table border="0" width="100%">
											<thead>
												<tr>
													<th>Suitcase/Box</th>
													<th>Product</th>
													<th>Quantity</th>
													<th>Serial/Lot Number</th>
													<th>Recipient</th>
												</tr>
											</thead>
											<tbody>	
												<g:set var="counter" value="${0 }" />														
													<g:if test="${shipmentInstance.allShipmentItems}">	
														<g:each var="itemInstance" in="${shipmentInstance?.allShipmentItems }" status="itemStatus"> 
															<tr class="${counter++ % 2 == 0 ? 'odd':'even'}">
																<td>
																	<g:if test="${itemInstance?.container?.parentContainer}">
																		${itemInstance?.container?.parentContainer?.containerType?.name} 
																		${itemInstance?.container?.parentContainer?.name} 
																		/
																	</g:if>
																	${itemInstance?.container?.containerType?.name} 
																	${itemInstance?.container?.name} 
																
																</td>
																<td>
																	${itemInstance?.product?.name}
																</td>
																<td>
																	${itemInstance?.quantity}
																</td>
																<td>
																	<g:if test="${itemInstance?.lotNumber}">
																		${itemInstance?.lotNumber}
																	</g:if>
																	<g:else>
																		${itemInstance?.serialNumber}
																	</g:else>
																</td>
																<td>
																	${itemInstance?.recipient?.name}
																</td>
															</tr>		
														</g:each>
													</g:if>
											</tbody>																					
										</table>													
									</td>
								</tr>
							</tbody>
						</table>					
					</div>
					
					<div class="buttons">
						<table>
							<tr>
								<td style="text-align: center;">
									<g:submitButton name="back" value="Back"></g:submitButton>	
									<g:submitButton name="submit" value="Next"></g:submitButton> 
								</td>
								<td style="text-align: right;">
									<g:submitButton name="done" value="Exit"></g:submitButton>						
								</td>
							</tr>
						</table>
					</div>
					
				</fieldset>
            </g:form>
        </div>
    </body>
</html>
