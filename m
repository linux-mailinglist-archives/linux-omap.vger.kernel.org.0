Return-Path: <linux-omap+bounces-3050-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C9BA07469
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 12:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79506162244
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 11:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5752F21638D;
	Thu,  9 Jan 2025 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TttcAB05"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D48C2FB;
	Thu,  9 Jan 2025 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421415; cv=none; b=MYD2jbdF1r+Gl47PspxtTZJGS4OU1OYlv9oZj5FZL5jaZCnM8ueCwlkuPya1is4doIL2zJw4FmEZi5WCBCx1jX618OSGjRB1eafzSQugnpvDsq+vfgXVdA6TWQXUy2GJLIh+HcImvfRUs15EiUQAYl7VqoydSt7jFJDvsT5Bhus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421415; c=relaxed/simple;
	bh=YcZdDFbElFyrvYg6aIkXG68xEeUr20BZuwHJ1ihrfrk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvvkPexBRrQlpCChvhlrER+LComVlkqqnSrCso/ujS7/mraucceDloo384GuyMXVbR7Bc56az+oFdXRyU5wsClmXg9Z06WaFI9wZa3omttsJ9IMRVLGKKW4ekBmw1unjQv1ireO30pmjncwvoSanzyz5RXR01+i8VyQmqP/VBLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TttcAB05; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 509BGUKa3254463
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 05:16:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736421390;
	bh=3JW9egJ7f52YOb2GHg6TSZuAgk3LsTV+d13hlGlvQeQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TttcAB053cAYKIrQpQ7BUR3TCPMIcJKE4IGrSUPIPWnV+A77n3CA5gmwt2tWfFNZe
	 k8CN5qM8wN5vaL9lxcMe1GAdFVUZD1SkAEWaWQVFk9eYhQVsDRgr6VIKx79QF0NiO9
	 aw4LyHg1+ecnqFIGCMqhzDMyJns/KW0pL39FF438=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509BGUS1014635
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 05:16:30 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 05:16:29 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 05:16:29 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509BGSDk080394;
	Thu, 9 Jan 2025 05:16:29 -0600
Date: Thu, 9 Jan 2025 16:46:28 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Romain Naour <romain.naour@smile.fr>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <conor+dt@kernel.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <kristo@kernel.org>,
        <vigneshr@ti.com>, <nm@ti.com>, <afd@ti.com>,
        Romain Naour <romain.naour@skf.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <s22zegpea2vjcrnx5jdhuat2lfunh36v5ynuxrsh5fp2o5pn4b@mxtyqch4eujx>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250109102627.1366753-1-romain.naour@smile.fr>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu, Jan 09, 2025 at 11:26:26AM +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> SoC are used to drive the reference clock to the PCIe Endpoint device via
> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> obtain the regmap for the ACSPCIE_CTRL register within the System
> Controller device-tree node in order to enable the PAD IO Buffers.
> 
> The Technical Reference Manual for J721e SoC with details of the
> ASCPCIE_CTRL registers is available at:
> https://www.ti.com/lit/zip/spruil1
> 
> Signed-off-by: Romain Naour <romain.naour@skf.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

