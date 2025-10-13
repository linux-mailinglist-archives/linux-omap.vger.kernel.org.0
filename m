Return-Path: <linux-omap+bounces-4675-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EAABD348E
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 15:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AE86B34C79D
	for <lists+linux-omap@lfdr.de>; Mon, 13 Oct 2025 13:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B32A22257E;
	Mon, 13 Oct 2025 13:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dVtZyAq1"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719EE18C31;
	Mon, 13 Oct 2025 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760363424; cv=none; b=t/s2qcJw0PXjitnlBRAiU0qr79YAdGeeSM7Xun6QfH+hnu8t6/SQwLo/SJDKMmtAXLJLRIwsYSnwCbc9kDmD3CwdOuPdVQ67koiyPLPcQ87Mp7UPjR+Cb65aHyy9gkUWVlPtdIMx4Gevhq8VgJjbY/ylT67r3GFE08akvVe3B+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760363424; c=relaxed/simple;
	bh=Q1QOICvmAitfhNSSpxLWIdiy9m6p1xYa1acRvITCss4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PTrt43gkt3mNMY8Ac5w/NFFIobSmpRqJ0DGdYiWrFSIGnOYCg04ZFp3vqza0dNSoHNfTID4dOyM3tnk0XrYC3Zuc2btPnkUWpxjoF7L8w0aYytQK89a+Yx04eMA+P2ueSDrZ1+HQ9zRY++r2ummp+lkGs+MtPr+FmkJlQbyAnic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dVtZyAq1; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DDm9DC832787;
	Mon, 13 Oct 2025 08:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760363289;
	bh=7lzWZwfkN6yG0zACVDnwclYhAVKYL7d1CxREgFPfD4Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dVtZyAq1KAobqo9m+n3m7U/Tj+uw0cZzSPKchAgVfJCg7pjWwG0F3QSGB8YIQZaHI
	 fxNNZV4fORQTBwkgYlsTzALTerl3iOmVGOALkt5kLt+K7TH5esw296npr1G7EErxrA
	 P4c9HeXTXR2VzZauhIWmDZOyw2fBMhewiVzwI4Ec=
Received: from DLEE204.ent.ti.com (dlee204.ent.ti.com [157.170.170.84])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DDm9OH224766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 08:48:09 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 08:48:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 08:48:08 -0500
Received: from [10.249.130.74] ([10.249.130.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DDlrST2144220;
	Mon, 13 Oct 2025 08:47:54 -0500
Message-ID: <463668d1-a6a7-4606-af05-25384eb97caa@ti.com>
Date: Mon, 13 Oct 2025 19:17:52 +0530
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm: dts: ti: Adds device tree nodes for PRU Cores,
 IEP and eCAP modules of PRU-ICSS2 Instance.
To: Parvathi Pudi <parvathi@couthit.com>, <tony@atomide.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <richardcochran@gmail.com>
CC: <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <danishanwar@ti.com>, <pratheesh@ti.com>, <prajith@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>, <srk@ti.com>, <rogerq@ti.com>,
        <krishna@couthit.com>, <mohan@couthit.com>, <pmohan@couthit.com>,
        <basharath@couthit.com>, "Andrew F . Davis" <afd@ti.com>,
        Murali Karicheri
	<m-karicheri2@ti.com>
References: <20251013125401.1435486-1-parvathi@couthit.com>
 <20251013125401.1435486-2-parvathi@couthit.com>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <20251013125401.1435486-2-parvathi@couthit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 10/13/2025 6:22 PM, Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> The TI Sitara AM57xx series of devices consists of 2 PRU-ICSS instances
> (PRU-ICSS1 and PRU-ICSS2). This patch adds the device tree nodes for the
> PRU-ICSS2 instance to support DUAL-MAC mode of operation.
> 
> Each PRU-ICSS instance consists of two PRU cores along with various
> peripherals such as the Interrupt Controller (PRU_INTC), the Industrial
> Ethernet Peripheral(IEP), the Real Time Media Independent Interface
> controller (MII_RT), and the Enhanced Capture (eCAP) event module.
> 
> am57-pruss.dtsi - Adds IEP and eCAP peripheral as child nodes of
> the PRUSS subsystem node.
> 
> am57xx-idk-common.dtsi - Adds PRU-ICSS2 instance node along with
> PRU eth port information and corresponding port configuration. It includes
> interrupt mapping for packet reception, HW timestamp collection, and
> PRU Ethernet ports in MII mode.
> 
> am571x-idk.dts, am572x-idk.dts and am574x-idk.dts - GPIO configuration
> along with delay configuration for individual PRU Ethernet port.
> 
> Reviewed-by: Mohan Reddy Putluru <pmohan@couthit.com>

Please don't carry internal review tags in upstream patches.

-- 
Thanks and Regards,
Md Danish Anwar


