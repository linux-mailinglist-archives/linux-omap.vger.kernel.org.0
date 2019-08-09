Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D978832D
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 21:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfHITQP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 15:16:15 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44420 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfHITQP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Aug 2019 15:16:15 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79JGANv048070;
        Fri, 9 Aug 2019 14:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565378170;
        bh=9CMUBE+vJ1FqMMj/PUgX3IexImp2swWsHQYpecxgeCc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BWUc+bxuf8jNqnEvVm7EUuXDFDQDVKiwZeqBpf6ME1+JbsaBmEi0vEO7PaTXyHOr3
         /rhypyrXMNE+V+AzGA1DFdvSKqOz+neODymqmRX1VzjjkWCVUwsqMDKDy1Q4dExoDf
         4fNVDDPhD+r6DH4SLFY5Fj0jtQa9jipiYYMDIx/M=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79JGAoK128393
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 9 Aug 2019 14:16:10 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 14:16:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 14:16:10 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79JGAAI078760;
        Fri, 9 Aug 2019 14:16:10 -0500
Subject: Re: [PATCH 0/3] ARM: OMAP2+: pdata quirk fixes for OMAP IOMMUs
To:     Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
References: <1565171081-7899-1-git-send-email-t-kristo@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <efabe829-90eb-247c-7d7a-9ab5a3c8e6bf@ti.com>
Date:   Fri, 9 Aug 2019 14:16:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1565171081-7899-1-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

On 8/7/19 4:44 AM, Tero Kristo wrote:
> Hi,
> 
> A few quick fixes for OMAP IOMMU pdata quirks. These basically apply
> one errata for remoteprocs, and also convert the support of iommus
> to ti-sysc from hwmod for omap4+ devices.

I do not think this series can go in independently by itself, right. I
understand that you have posted the individual bits based on your
integrated branch but the patches do have dependencies against patches
against other subsystems.

You cannot remove the reset stuff without a breakage in functionality
and without the PRM driver being merged. The second patch has
dependencies from the OMAP IOMMU fixes series [1] which Joerg has picked
up today.

Have you tested these series individually? We will want to restore the
current broken functionality with clkctrl when using hwmods first, bring
in the PRM pieces and ti-sysc pieces and then transition over. We can
directly go ti-sysc with DRA7 MMUs.

regards
Suman

[1]
https://lore.kernel.org/linux-iommu/20190809153730.GF12930@8bytes.org/T/#mec99f8e8ed351689f4fcc76f4f000f9144a02b51
