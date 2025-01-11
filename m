Return-Path: <linux-omap+bounces-3088-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 958F0A0A4CD
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jan 2025 17:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9210A3A7ADB
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jan 2025 16:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A341B3F30;
	Sat, 11 Jan 2025 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0PdG/DV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2F11B393A;
	Sat, 11 Jan 2025 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736613324; cv=none; b=TDOswXqpwS4jr8JDUSlG98Vdwj/3joLN9UuUJIs8DOGLYdUd4iCaTK4da7CHrwaskfO0tMqYKnvO++TKe8VkQrLuQ1a1c4KUDLHWYx1FsDGifXAiTUveJRQ6qPwvtdAKqcimI5npvMcH8SKxa5lwGiN9fu5eXdiA4g7NC9nRgzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736613324; c=relaxed/simple;
	bh=GJC+MFj2hHEWDd5H4ukPbV2a3QRnUXzE1voqmG5gnc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqG+/gPP+Xu+UNA2V2I10sVblpoxDHEc8oochdYrDbayU2CoFIup8ZM2cG6F1qkipSDJDE21ZeoPCPOXZrFnk6RhWLK3lf9iBg4//itI16JYShJsK5RSb+XgjQZg0yIvfemg3I2HEtxXjkyPMRXuZvu0MXh29+1cKyl28XwrjkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0PdG/DV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216281bc30fso60674335ad.0;
        Sat, 11 Jan 2025 08:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736613322; x=1737218122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QFpAwlhscCSDaqV4J6CvbYoGhHQAUaA0Ln+PXMaf8A=;
        b=a0PdG/DVaLSw2we9qu+iGocZ6Bko3GWuRdXs0FzfiZ6AZH8QCyXKp8AKaF1t2r8F9n
         a2+PzyfQ9euM4MWzSU4WLkXlqkSMXJzMxhFn1cSPscoLE6iHvbRMIp2+WhitCy1P+Nl8
         LXO05R8//2+o7I46mJ7l+uBYGVUpkoepwTPK1Sno8zNOoCI+dAnKHsiUeun2zPbA3jYn
         4oQwomw3GTc9+gwULwz6CAsAqtf3SyMmJ560n+AP+7EiNHhUwIOvafMBsoDkLlfQ4LHh
         +4L3WJu9qFMyY7HDHMF9IX70k5q9ZsS7up4EkrEPs5LZ+7LPKqIT3yCLJ2GnAby+VCPU
         wVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736613322; x=1737218122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QFpAwlhscCSDaqV4J6CvbYoGhHQAUaA0Ln+PXMaf8A=;
        b=Oai7JHD3ksrppUU7Q4KQ/AB99j3F1BmNhlJycCdpuh3Dm1UHkDKBUfVhKO99f9kzLD
         5879bVtR77/8XWD6j3/uDX5jJQy/eZhfe6O1hPST2zA9SV9h+E9qUuJ9N2+/c1XjHUDw
         yU/Uozbr1N0S1QfqP11E7wtEHh7GvYV6TaCEX3mgfjyJgKlDdFMF1PGGYDA4caZo5sgM
         SYfYFgnWn2fPLJu12VvMDF4WRUljDcJOoeFNVyHsMax0MWitOALqUtkhApHABbuFPNL6
         uKnKk/qDOcQde21LigwwllHst5r6hBiLnVP+cluJzA0o7113hiAXHE0DvksWk8Eg+1/L
         hkVw==
X-Forwarded-Encrypted: i=1; AJvYcCW6wkYqadydP9/j6J+c4GeUaDGkPVi8VmeP0iIdh1b4Igmvu53w3ueQLv9WVzzqW+Oqy8FFqDbj@vger.kernel.org, AJvYcCWOJI0HFo5j/wRi/m3kyYyJtym9RkcuF1be67e69hjO4MXbNg/WIqsLT/nno0azcj3b9DRBQZ/WGmSp@vger.kernel.org, AJvYcCXFd/k+2rohxnqocelhvF8okri7kcBfOcEFPQeFb8igoeHEARowo/+Z9WE1riJB8DdIJVrVbxwEW/t2K3gq@vger.kernel.org, AJvYcCXSA+aQtGh2XjvoJkXVsqUTwcE/Dq2vdIrsYAuug3vfcwyR7GYK/2pAL9RoTRdspdO3SLwEKvCpVE+IsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVv9+5WKgcPdxvAfRy0KQ6TU3ZBedxmTtxNyKJ+62ozWWtz+mf
	DtfXQvGtrkW4RyshBMOmGwX3+ziZ8O0u62vCQgHy5lmdn5ivw7+a
X-Gm-Gg: ASbGncvhlCAx//1AIwbwL8CEGP2kasH8K2uT1UboQtQQpowOU4aEYDhUzcSxYyKeSJG
	66rs46YfrnJbjp/6UoeH6bj4BY/IDhwDI0t6Tb0MNepvZayzNQLDK9eFc4NjZgFPzizgxLFXZ1b
	yaQd4JG1SxGTO9vNy3RdCUSvAEnMPEn0arRCUg2Y0g57lsu/p8x6PVqnF1QK6p8YgxWjo4iAckV
	F8Gszay8aYQGKEfDbMiS7WnUWVPAb/s1eu6V21WranatKo0HtsNtXk76aRNJrt+eU8PtAaEksmb
X-Google-Smtp-Source: AGHT+IFg0xphykRhQKusjtbwyZ+bfCNk9Lo/GQN5SR+nGcOGfnhtXjaDW/RgazWXKPH9B+cVxv1LDQ==
X-Received: by 2002:a17:902:ecc7:b0:215:a18f:88a8 with SMTP id d9443c01a7336-21a83fdf379mr199295665ad.51.1736613321903;
        Sat, 11 Jan 2025 08:35:21 -0800 (PST)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f259fb5sm29138805ad.239.2025.01.11.08.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 08:35:21 -0800 (PST)
Date: Sat, 11 Jan 2025 08:35:17 -0800
From: Richard Cochran <richardcochran@gmail.com>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	tony@atomide.com, parvathi@couthit.com, schnelle@linux.ibm.com,
	rdunlap@infradead.org, diogo.ivo@siemens.com, m-karicheri2@ti.com,
	horms@kernel.org, jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Subject: Re: [RFC PATCH 06/10] net: ti: prueth: Adds HW timestamping support
 for PTP using PRU-ICSS IEP module
Message-ID: <Z4KdxQMBXmkF37KI@hoboy.vegasvil.org>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250110055906.65086-7-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110055906.65086-7-basharath@couthit.com>

On Fri, Jan 10, 2025 at 11:29:02AM +0530, Basharath Hussain Khaja wrote:

> @@ -189,12 +190,37 @@ static void icssm_emac_get_regs(struct net_device *ndev,
>  	regs->version = PRUETH_REG_DUMP_GET_VER(prueth);
>  }
>  
> +static int icssm_emac_get_ts_info(struct net_device *ndev,
> +				  struct kernel_ethtool_ts_info *info)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +
> +	if ((PRUETH_IS_EMAC(emac->prueth) && !emac->emac_ptp_tx_irq))
> +		return ethtool_op_get_ts_info(ndev, info);
> +
> +	info->so_timestamping =
> +		SOF_TIMESTAMPING_TX_HARDWARE |
> +		SOF_TIMESTAMPING_TX_SOFTWARE |

The driver advertises software Transmit time stamping, but where is
the call to skb_tx_timestamp() ?

I didn't see it in Patch #4.

> +		SOF_TIMESTAMPING_RX_HARDWARE |
> +		SOF_TIMESTAMPING_RX_SOFTWARE |
> +		SOF_TIMESTAMPING_SOFTWARE |
> +		SOF_TIMESTAMPING_RAW_HARDWARE;
> +
> +	info->phc_index = icss_iep_get_ptp_clock_idx(emac->prueth->iep);
> +	info->tx_types = BIT(HWTSTAMP_TX_OFF) | BIT(HWTSTAMP_TX_ON);
> +	info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
> +				BIT(HWTSTAMP_FILTER_PTP_V2_EVENT);
> +
> +	return 0;
> +}

> @@ -442,6 +482,173 @@ static void icssm_emac_adjust_link(struct net_device *ndev)
>  	spin_unlock_irqrestore(&emac->lock, flags);
>  }
>  
> +static u8 icssm_prueth_ptp_ts_event_type(struct sk_buff *skb, u8 *ptp_msgtype)
> +{
> +	unsigned int ptp_class = ptp_classify_raw(skb);
> +	struct ptp_header *hdr;
> +	u8 msgtype, event_type;
> +
> +	if (ptp_class == PTP_CLASS_NONE)
> +		return PRUETH_PTP_TS_EVENTS;
> +
> +	hdr = ptp_parse_header(skb, ptp_class);
> +	if (!hdr)
> +		return PRUETH_PTP_TS_EVENTS;
> +
> +	msgtype = ptp_get_msgtype(hdr, ptp_class);
> +	/* Treat E2E Delay Req/Resp messages sane as P2P peer delay req/resp

s/sane/in the same way/

> +	 * in driver here since firmware stores timestamps in the same memory
> +	 * location for either (since they cannot operate simultaneously
> +	 * anyway)
> +	 */
> +	switch (msgtype) {
> +	case PTP_MSGTYPE_SYNC:
> +		event_type = PRUETH_PTP_SYNC;
> +		break;
> +	case PTP_MSGTYPE_DELAY_REQ:
> +	case PTP_MSGTYPE_PDELAY_REQ:
> +		event_type = PRUETH_PTP_DLY_REQ;
> +		break;
> +	/* TODO: Check why PTP_MSGTYPE_DELAY_RESP needs timestamp
> +	 * and need for it.
> +	 */
> +	case 0x9:

Delay response messages are PTP "general" messages and not event
messages, and as such they do not require time stamps.

> +	case PTP_MSGTYPE_PDELAY_RESP:
> +		event_type = PRUETH_PTP_DLY_RESP;
> +		break;
> +	default:
> +		event_type = PRUETH_PTP_TS_EVENTS;
> +	}
> +
> +	if (ptp_msgtype)
> +		*ptp_msgtype = msgtype;
> +
> +	return event_type;
> +}

Thanks,
Richard

