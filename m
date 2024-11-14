Return-Path: <linux-omap+bounces-2679-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0570D9C8969
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 13:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE7EEB2735A
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 12:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F411F8925;
	Thu, 14 Nov 2024 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fznc+nOG"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F656192D9D
	for <linux-omap@vger.kernel.org>; Thu, 14 Nov 2024 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731585778; cv=none; b=gkhmDchI/100WQYWRQAGq3fvUPGpAQdABADgjlB1mMrOdvnesRilpMypSAFb3ZO3yHsbHHreV1hy6fhFIEll4sXynpjNmm/rNIiEIW6lAQDmAfqPtzxpjzbOq4jJYt36jr0MYCvlfQzqIJdyNAhrRhBuSiqbk16ijo7kpRDw0dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731585778; c=relaxed/simple;
	bh=k8vvHLSi3/Ba27sZNaoHwLkf9qlD47v6sneOKR2gKYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwSzqyuFuE2CenT4WRLPdM2MN6WIl8/aLfSKfsNG7SrJA1XFUDj+88HsyA2JjhK8ROGr+OWniHlwA5LGw/+5+ychDZq9bX80fz9KuulrMZsK9vqrdemtndjFKfPc0gCi9Cgrmm5aovvbIO9E4vP6GsPKDaxjkJ35VErN1lUcAyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fznc+nOG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731585775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/zpQdMqKFFqaHRJ8M6WcgEvfRNF6AeI76vWq5L2MI+s=;
	b=Fznc+nOGaguHCQCc9mXTjW+lVWLTCJpI2Uq0LJgbLoPL/mcLadlXGvHbSvxYvKVTubXF/u
	ekIR2SKvcmjrA1fpUX9WEKnQh+49u0Lq2NGkuuTIbyqzPfdiHn+63fd4BS7SAIbYCtlb8w
	ErGQY9nvZzPIwFh0sB1awLatMYu1LQQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-jjg0wnn9Mw2IxbGgQ9iCLA-1; Thu, 14 Nov 2024 07:02:54 -0500
X-MC-Unique: jjg0wnn9Mw2IxbGgQ9iCLA-1
X-Mimecast-MFC-AGG-ID: jjg0wnn9Mw2IxbGgQ9iCLA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4315af466d9so4027935e9.3
        for <linux-omap@vger.kernel.org>; Thu, 14 Nov 2024 04:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731585773; x=1732190573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zpQdMqKFFqaHRJ8M6WcgEvfRNF6AeI76vWq5L2MI+s=;
        b=SS6fNunocwqHUX6YyYyzqlOg9q79J2qOnn62NH+jBJUN1kGA6tFIHcT/xxolx6LVZt
         RXtgv3jVe0yEG7Rtj6NAj1C5Q5cv3xzRofUJeF3TtMV8p142JR/ChhNVKk5wbPyBkrLw
         0/JBripdZs5lm7PVQuaAjHkUMB0vN+nLy6KYi7csc5WaJT9DuqGN6IVBXuHe2Ub6hQZW
         a/Tdda8f53kTih1HkxWLKMCmJGdrukU+yZi6SgpjRMDZESE7ehrPIx7xul0Sx873mRiq
         1LroRwQRqwUanMh55ht54bAYna7rr93/P6+nKKE6vrDpuP0Ny1eb64VyBFZ+aXyxm4mW
         Byow==
X-Forwarded-Encrypted: i=1; AJvYcCWgFVG65fUAhsBzyteAFynFPnrzAVk1anvB/vN/H40Mapv4gfaQLtDWWq2RvSkdri3akZKUZ18cVTPH@vger.kernel.org
X-Gm-Message-State: AOJu0YxTsUXsQsdvvGczE0X7pVX4t8cx4Fb9GCObboJbjEOvjrbnUnxQ
	xy5dlOiAD8owHzyV0eFiFInsAEAexdk9dLGvb6JRvvx9NGJi1EpKWhkCzFPlQZXsI8hhjuAjrkI
	UtNTO3Et50jy4wUMs3jAid9HL+sEDnhVBUDOJEMnWnK/E6yLTzjk6k/QxX3w=
X-Received: by 2002:a05:600c:4689:b0:431:57e5:b251 with SMTP id 5b1f17b1804b1-432da7dc45fmr14238805e9.28.1731585773168;
        Thu, 14 Nov 2024 04:02:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbgc10bxAJ/VIRFkaOi6IwkSPLAJX2D33rxzmsycb7616hQU5vNcmjB3rsRSBucznfT6zuWQ==
X-Received: by 2002:a05:600c:4689:b0:431:57e5:b251 with SMTP id 5b1f17b1804b1-432da7dc45fmr14238395e9.28.1731585772696;
        Thu, 14 Nov 2024 04:02:52 -0800 (PST)
Received: from debian (2a01cb058d23d600b637ad91a758ba3f.ipv6.abo.wanadoo.fr. [2a01:cb05:8d23:d600:b637:ad91:a758:ba3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da298a41sm21695655e9.38.2024.11.14.04.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 04:02:52 -0800 (PST)
Date: Thu, 14 Nov 2024 13:02:49 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-omap@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, srk@ti.com,
	Pekka Varis <p-varis@ti.com>
Subject: Re: [PATCH net-next v3 2/2] net: ethernet: ti: am65-cpsw: enable
 DSCP to priority map for RX
Message-ID: <ZzXm6SHjRfbaOX14@debian>
References: <20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org>
 <20241109-am65-cpsw-multi-rx-dscp-v3-2-1cfb76928490@kernel.org>
 <ZzVBS1zXIy31pnaf@debian>
 <76dd6141-5852-43ae-af98-f0edf0bc10f5@kernel.org>
 <8bfe8acc-9514-4ba8-9498-2427ddb0bb78@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bfe8acc-9514-4ba8-9498-2427ddb0bb78@kernel.org>

On Thu, Nov 14, 2024 at 12:12:47PM +0200, Roger Quadros wrote:
> On 14/11/2024 11:41, Roger Quadros wrote:
> > On 14/11/2024 02:16, Guillaume Nault wrote:
> >> So what about following the IETF mapping found in section 4.3?
> >> https://datatracker.ietf.org/doc/html/rfc8325#section-4.3
> > 
> > Thanks for this tip.
> > I will update this patch to have the default DSCP to UP mapping as per
> > above link and map all unused DSCP to UP 0.
> 
> How does the below code look in this regard?

Looks generally good to me. A few comments inline though.

> static void am65_cpsw_port_enable_dscp_map(struct am65_cpsw_port *slave)
> {
> 	int dscp, pri;
> 	u32 val;
> 
> 	/* Default DSCP to User Priority mapping as per:
> 	 * https://datatracker.ietf.org/doc/html/rfc8325#section-4.3

Maybe also add a link to
https://datatracker.ietf.org/doc/html/rfc8622#section-11
which defines the LE PHB (Low Effort) and updates RFC 8325 accordingly.

> 	 */
> 	for (dscp = 0; dscp <= AM65_CPSW_DSCP_MAX; dscp++) {
> 		switch (dscp) {
> 		case 56:	/* CS7 */
> 		case 48:	/* CS6 */
> 			pri = 7;
> 			break;
> 		case 46:	/* EF */
> 		case 44:	/* VA */
> 			pri = 6;
> 			break;
> 		case 40:	/* CS5 */
> 			pri = 5;
> 			break;
> 		case 32:	/* CS4 */
> 		case 34:	/* AF41 */
> 		case 36:	/* AF42 */
> 		case 38:	/* AF43 */
> 		case 24:	/* CS3 */
> 		case 26:	/* AF31 */
> 		case 28:	/* AF32 */
> 		case 30:	/* AF33 */

Until case 32 (CS4) you've kept the order of RFC 8325, table 1.
It'd make life easier for reviewers if you could keep this order
here. That is, moving CS4 after AF43 and CS3 after AF33.

> 			pri = 4;
> 			break;
> 		case 17:	/* AF21 */

AF21 is 18, not 17.

> 		case 20:	/* AF22 */
> 		case 22:	/* AF23 */
> 			pri = 3;
> 			break;
> 		case 8:		/* CS1 */

Let's be complete and add the case for LE (RFC 8622), which also
maps to 1.

> 			pri = 1;
> 			break;
> 		default:
> 			pri = 0;
> 			break;
> 		}
> 
> 		am65_cpsw_port_set_dscp_map(slave, dscp, pri);
> 	}
> 
> 	/* enable port IPV4 and IPV6 DSCP for this port */
> 	val = readl(slave->port_base + AM65_CPSW_PORTN_REG_CTL);
> 	val |= AM65_CPSW_PN_REG_CTL_DSCP_IPV4_EN |
> 		AM65_CPSW_PN_REG_CTL_DSCP_IPV6_EN;
> 	writel(val, slave->port_base + AM65_CPSW_PORTN_REG_CTL);
> }
> 
> > 
> > Is there any mechanism/API for network administrator to change this
> > default mapping in the network drivers?
> > 
> >>
> >>>  static void am65_cpsw_sl_ctl_reset(struct am65_cpsw_port *port)
> >>>  {
> >>>  	cpsw_sl_reset(port->slave.mac_sl, 100);
> >>> @@ -921,6 +974,7 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
> >>>  	common->usage_count++;
> >>>  
> >>>  	am65_cpsw_port_set_sl_mac(port, ndev->dev_addr);
> >>> +	am65_cpsw_port_enable_dscp_map(port);
> >>>  
> >>>  	if (common->is_emac_mode)
> >>>  		am65_cpsw_init_port_emac_ale(port);
> >>>
> >>> -- 
> >>> 2.34.1
> >>>
> >>>
> >>
> > 
> 
> -- 
> cheers,
> -roger
> 


