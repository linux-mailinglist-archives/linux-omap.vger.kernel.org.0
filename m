Return-Path: <linux-omap+bounces-2680-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E8C9C899E
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 13:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 660111F23C07
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 12:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB791F9AAC;
	Thu, 14 Nov 2024 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IcDFA5f+"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19811F8F13
	for <linux-omap@vger.kernel.org>; Thu, 14 Nov 2024 12:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731586417; cv=none; b=G7UpeW2cEoPVl0J4Uv5zMf5EzZtxRyV20hicV1PM/+arkvjX1RgICZvoGY1JVfUvygw9T+gd6vxUbBnV5GorQSknv2EoBzOpMxYgYfyx5A0URcvdxBZtMfEJEDtK9AHS3Xrozq1uFGgJn9HumhcwlCD2sye5yEFoZCPziGCbHc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731586417; c=relaxed/simple;
	bh=CbxVdzYrFN0Rc6HX6DJygzhjMpNgmZS2CQx01qtzLks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZh0a8Dh9xdPlFEe92dDBavnMqjpD4sGOkh4pvy8M6F8K3v5iwqsea0hrIHSHweAuowTPj6q5nPkOoih4CNT/sVnIVW4YSptw6I8t3As0eQYGf1kN/Ek/aiir4FpA0zwBo7snct4EPCD8lan5ovUBv70D3WJSt0VoiFUCN0rCcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IcDFA5f+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731586414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cly6bVWd8F14UabEVcpsy5I4VZ1zPdkEsEJB7rN/meQ=;
	b=IcDFA5f+K62MGNNNbMw2WoJIJDk/m7USRTHJ6S1I/DF6T7PK+ri64LPMAehie1NwsRwTXk
	t3NwQXwG+90+F32F14NmLJXboOiGq6ocDY3A1Jrb5rYCkefYi/XBr1sBqzgyQGNdiNMGk9
	A0FlG9jn7OxCM0t9TI3wZ1d6SewPEBo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-gvRHExYkM0qUVhYSuak4vw-1; Thu, 14 Nov 2024 07:13:32 -0500
X-MC-Unique: gvRHExYkM0qUVhYSuak4vw-1
X-Mimecast-MFC-AGG-ID: gvRHExYkM0qUVhYSuak4vw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4316e2dde9eso5533635e9.2
        for <linux-omap@vger.kernel.org>; Thu, 14 Nov 2024 04:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731586411; x=1732191211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cly6bVWd8F14UabEVcpsy5I4VZ1zPdkEsEJB7rN/meQ=;
        b=qxYgYVfytYsrrUwzJjJruU83mwpSVPv8+Z2VillqdzeL6iFJXOGYl3TJmbq6FdKRn6
         7CZY/reGyNf5YZl2LidyyL3GYoKGL+twxaqkW2LbmA1sMV01D5CPuOJdeqfP7eERTRHG
         Hw73ctJ3emN9eDNiHx0f3HT0Vx7IeEQgHQ1g1lzcKBb7rzvhqcKWq1RBYNlF6VLU/9ck
         JocPtRzThrSTxvPJ2ohUj/OLCoOm9dY0creS5hJNrE42ArPG8bVS/cY63SnydnYXnCTE
         GtO0Lrdn9tue/w5EKlElr2fKjmQsOyXeTzdtn7Xa1iwsM5ob8xx8cfHWsqnU3rMDgOC3
         ttlw==
X-Forwarded-Encrypted: i=1; AJvYcCUjUhnhbOALBxwOyXnov6Y71Py2VyvrNTKs0mHs48SfHlmKfw6NBG/lxIORe6nt3vdINSkkYfykigxL@vger.kernel.org
X-Gm-Message-State: AOJu0YyyhJJeR1Q0ORkHR7dHBLUCSLNV3fAL5iyi3tokPYUcY1ov1ElI
	U/xxfoJbO/aSHLlLO/QMnrkqwy4yp3cm5FBmLbELcUdu4C4bQH2d9ytZC+lQhfMS6dAHcn3DCfd
	lyO9q9eAy05qTxn4v3RtCaxkmoLDDgWIXj1PtSGd/txG6wB24Z8iOuv++JD8=
X-Received: by 2002:a05:600c:314c:b0:431:9a26:3cf6 with SMTP id 5b1f17b1804b1-432da7a050fmr21849645e9.4.1731586411554;
        Thu, 14 Nov 2024 04:13:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEelpsYsAMJEhvqChDBQAHMLVQDVU/v0XCvhnfuE1ZX64VQE6EmoBwwBHx+3SP7UFRTyvl+5g==
X-Received: by 2002:a05:600c:314c:b0:431:9a26:3cf6 with SMTP id 5b1f17b1804b1-432da7a050fmr21849185e9.4.1731586411150;
        Thu, 14 Nov 2024 04:13:31 -0800 (PST)
Received: from debian (2a01cb058d23d600b637ad91a758ba3f.ipv6.abo.wanadoo.fr. [2a01:cb05:8d23:d600:b637:ad91:a758:ba3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da29ffe9sm22060855e9.44.2024.11.14.04.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 04:13:30 -0800 (PST)
Date: Thu, 14 Nov 2024 13:13:28 +0100
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
Message-ID: <ZzXpaC7X2UBt77+2@debian>
References: <20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org>
 <20241109-am65-cpsw-multi-rx-dscp-v3-2-1cfb76928490@kernel.org>
 <ZzVBS1zXIy31pnaf@debian>
 <76dd6141-5852-43ae-af98-f0edf0bc10f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76dd6141-5852-43ae-af98-f0edf0bc10f5@kernel.org>

On Thu, Nov 14, 2024 at 11:41:06AM +0200, Roger Quadros wrote:
> On 14/11/2024 02:16, Guillaume Nault wrote:
> > So what about following the IETF mapping found in section 4.3?
> > https://datatracker.ietf.org/doc/html/rfc8325#section-4.3
> 
> Thanks for this tip.
> I will update this patch to have the default DSCP to UP mapping as per
> above link and map all unused DSCP to UP 0.
> 
> Is there any mechanism/API for network administrator to change this
> default mapping in the network drivers?

I'm not aware of any (appart from manual update with tc), but I could
have missed something. It'd probably make sense to have such a
mechanism though.

> >>  static void am65_cpsw_sl_ctl_reset(struct am65_cpsw_port *port)
> >>  {
> >>  	cpsw_sl_reset(port->slave.mac_sl, 100);
> >> @@ -921,6 +974,7 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
> >>  	common->usage_count++;
> >>  
> >>  	am65_cpsw_port_set_sl_mac(port, ndev->dev_addr);
> >> +	am65_cpsw_port_enable_dscp_map(port);
> >>  
> >>  	if (common->is_emac_mode)
> >>  		am65_cpsw_init_port_emac_ale(port);
> >>
> >> -- 
> >> 2.34.1
> >>
> >>
> > 
> 
> -- 
> cheers,
> -roger
> 


