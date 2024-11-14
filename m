Return-Path: <linux-omap+bounces-2690-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE29C8EF8
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 17:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1248B3DEB7
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 15:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5639018C930;
	Thu, 14 Nov 2024 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AqwHYFJ+"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396C6188703
	for <linux-omap@vger.kernel.org>; Thu, 14 Nov 2024 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731599004; cv=none; b=did3vaGvbCi+U/Zn4hxmNsj8IQ4J4flA9wBuRmNFbnBBHkPNN8PcpZ7cUNqPrEPZv14tt3/7T+1Ch269sGdQvWqyPUEszbJec8vy1Zv3kw1ezsyA7icOODUyF+O/0HRsuc7JBUTLnv+owZCgQHNlY2o+SYfhantCrLsURJqp53w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731599004; c=relaxed/simple;
	bh=cpkpvcI4nnZ6IoTG09tDrpa0CY5qnKUuAFVyTovamKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPx2ioQ9CywHGpIdOzZ7v0NToN+c0RuuPfkpVn/H7q5jwTVujBSPWRzpIMzntNrWMc3BG88cDspSu04JZy0Lnx1ClxDr1z0Ns743+B2ENf1fvh6vbFp6MeXTEVb+cf4uTYTIfvbDKlRNZIxMcSiM916akC1ZKp9knPzU9G+00h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AqwHYFJ+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731599001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXhPhd6T64qopenKzDTr2VAsOd523bKkU/nV0+x9Uek=;
	b=AqwHYFJ+saH5LOqtAcK7Dz1cRm+0KdKf355iw/MXndqVgQCLjmb4eZ8sEmmvz7cj/N8tZ0
	eApc1J5EoN+F34rY5G+IpJPKDPQD52BlvrJmTevhHyAjmS1+9PnDkGVMpqnD5KapKTt9mV
	y9fayrOrJSwOLYJP8u8XIM+oRjniKWk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-v0U6xcnDOp2XZnfAuGosQw-1; Thu, 14 Nov 2024 10:43:19 -0500
X-MC-Unique: v0U6xcnDOp2XZnfAuGosQw-1
X-Mimecast-MFC-AGG-ID: v0U6xcnDOp2XZnfAuGosQw
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d5ca192b8so491011f8f.1
        for <linux-omap@vger.kernel.org>; Thu, 14 Nov 2024 07:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731598998; x=1732203798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXhPhd6T64qopenKzDTr2VAsOd523bKkU/nV0+x9Uek=;
        b=uqtKwr3BYLSBJUQNxJgWNptvNPXibnZnrRQBmNtlYD9Oi5aTVNLp7DgYgq097u0Kzf
         PEzdWEsmlCjs6b4jhHnMfq+17Dd+A3x0y6ib39rzPte7aPRV0WZRQ5lPlLbRJxMAYSBP
         ZHR7FhzzmAxYtMMbAHPRvGzGkexFhLhG5wBzz1I4XRM1OHzpoKmJb3Ipta66y543Z+DQ
         0YbA9Zf7IvGFdgP7etzxqD+pGqjMWxqIvBAEstHrgnni/xDL05NmV4bYZc4zn39EQmWf
         LLgP9F7MbPR8slIeKd+aGvvhLgm1aaBQARZDMCpfxpjTdIRMkwLUewwnjSFwVJjtZAPy
         kX1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVXQTm7x2lHeAlL+dXon04jTEnJsVEO9lhl1RYCK115W5RIakOypCQqXCTh1ol0e41KtRkCaK0OtF6@vger.kernel.org
X-Gm-Message-State: AOJu0YyNvXMwpvXs4TPV0Jpv865GpiQS8DNXplvThAUKH7qZ74zT98tq
	QIjgbYI6uW2TmnNdjmJXXF5DEsjqPkKFyeEFi5u8aweAxT5JyphvHZ2DqLR5BnpbIsbOabIt8KY
	1rLorZ+IBMx6Z1Ze25skoqclBG3xt+Ee27MpaPAIYxscRg30PgRdNmlZCVIU=
X-Received: by 2002:a05:6000:184f:b0:381:e771:e6dc with SMTP id ffacd0b85a97d-382140752femr3138951f8f.28.1731598998155;
        Thu, 14 Nov 2024 07:43:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoMlXHEHIIIf/8vuBedCySo4LpdsmnKwwPgZlfZJLBlokpUPY1g/zGswFuAox/GMsDltKRSg==
X-Received: by 2002:a05:6000:184f:b0:381:e771:e6dc with SMTP id ffacd0b85a97d-382140752femr3138917f8f.28.1731598997736;
        Thu, 14 Nov 2024 07:43:17 -0800 (PST)
Received: from debian (2a01cb058d23d600b637ad91a758ba3f.ipv6.abo.wanadoo.fr. [2a01:cb05:8d23:d600:b637:ad91:a758:ba3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab7206csm24235755e9.7.2024.11.14.07.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 07:43:17 -0800 (PST)
Date: Thu, 14 Nov 2024 16:43:15 +0100
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
Subject: Re: [PATCH net-next v4 1/2] net: ethernet: ti: am65-cpsw: update
 pri_thread_map as per IEEE802.1Q-2014
Message-ID: <ZzYak49k8fQC76/+@debian>
References: <20241114-am65-cpsw-multi-rx-dscp-v4-0-93eaf6760759@kernel.org>
 <20241114-am65-cpsw-multi-rx-dscp-v4-1-93eaf6760759@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114-am65-cpsw-multi-rx-dscp-v4-1-93eaf6760759@kernel.org>

On Thu, Nov 14, 2024 at 03:36:52PM +0200, Roger Quadros wrote:
> IEEE802.1Q-2014 supersedes IEEE802.1D-2004. Now Priority Code Point (PCP)
> 2 is no longer at a lower priority than PCP 0. PCP 1 (Background) is still
> at a lower priority than PCP 0 (Best Effort).

Reviewed-by: Guillaume Nault <gnault@redhat.com>

> Reference:
> IEEE802.1Q-2014, Standard for Local and metropolitan area networks
>   Table I-2 - Traffic type acronyms
>   Table I-3 - Defining traffic types
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/net/ethernet/ti/cpsw_ale.c | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> index 8d02d2b21429..9f79056b3f48 100644
> --- a/drivers/net/ethernet/ti/cpsw_ale.c
> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> @@ -1692,26 +1692,34 @@ static void cpsw_ale_policer_reset(struct cpsw_ale *ale)
>  void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
>  {
>  	int pri, idx;
> -	/* IEEE802.1D-2004, Standard for Local and metropolitan area networks
> -	 *    Table G-2 - Traffic type acronyms
> -	 *    Table G-3 - Defining traffic types
> -	 * User priority values 1 and 2 effectively communicate a lower
> -	 * priority than 0. In the below table 0 is assigned to higher priority
> -	 * thread than 1 and 2 wherever possible.
> -	 * The below table maps which thread the user priority needs to be
> +
> +	/* Reference:
> +	 * IEEE802.1Q-2014, Standard for Local and metropolitan area networks
> +	 *    Table I-2 - Traffic type acronyms
> +	 *    Table I-3 - Defining traffic types
> +	 * Section I.4 Traffic types and priority values, states:
> +	 * "0 is thus used both for default priority and for Best Effort, and
> +	 *  Background is associated with a priority value of 1. This means
> +	 * that the value 1 effectively communicates a lower priority than 0."
> +	 *
> +	 * In the table below, Priority Code Point (PCP) 0 is assigned
> +	 * to a higher priority thread than PCP 1 wherever possible.
> +	 * The table maps which thread the PCP traffic needs to be
>  	 * sent to for a given number of threads (RX channels). Upper threads
>  	 * have higher priority.
>  	 * e.g. if number of threads is 8 then user priority 0 will map to
> -	 * pri_thread_map[8-1][0] i.e. thread 2
> +	 * pri_thread_map[8-1][0] i.e. thread 1
>  	 */
> -	int pri_thread_map[8][8] = {	{ 0, 0, 0, 0, 0, 0, 0, 0, },
> +
> +	int pri_thread_map[8][8] = {   /* BK,BE,EE,CA,VI,VO,IC,NC */
> +					{ 0, 0, 0, 0, 0, 0, 0, 0, },
>  					{ 0, 0, 0, 0, 1, 1, 1, 1, },
>  					{ 0, 0, 0, 0, 1, 1, 2, 2, },
> -					{ 1, 0, 0, 1, 2, 2, 3, 3, },
> -					{ 1, 0, 0, 1, 2, 3, 4, 4, },
> -					{ 1, 0, 0, 2, 3, 4, 5, 5, },
> -					{ 1, 0, 0, 2, 3, 4, 5, 6, },
> -					{ 2, 0, 1, 3, 4, 5, 6, 7, } };
> +					{ 0, 0, 1, 1, 2, 2, 3, 3, },
> +					{ 0, 0, 1, 1, 2, 2, 3, 4, },
> +					{ 1, 0, 2, 2, 3, 3, 4, 5, },
> +					{ 1, 0, 2, 3, 4, 4, 5, 6, },
> +					{ 1, 0, 2, 3, 4, 5, 6, 7 } };
>  
>  	cpsw_ale_policer_reset(ale);
>  
> 
> -- 
> 2.34.1
> 


