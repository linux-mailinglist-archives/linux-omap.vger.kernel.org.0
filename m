Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D331851C83
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jun 2019 22:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732019AbfFXUjD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jun 2019 16:39:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41568 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbfFXUjD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jun 2019 16:39:03 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OKcqA8077427;
        Mon, 24 Jun 2019 15:38:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561408732;
        bh=Rx7KKINFV12iE6CsBC74T41LgUQI1T0uN4iRkdsLxVY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=S1lURTsrPoOWHuJSpNy7BEmoQkPEfxkyyRt7zqaLIMNkoAmyildJrQqyBevODEeE2
         /bc4RgLar3zkS/jeToHT5IySR880x7GTjCXitX1MVc1V5mTxg+k3tIE6yXltodEyWb
         hMx+3eNzvXj22AZMUbbKtuS0OKqgpVGATkXRAy8M=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OKcquw069074
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Jun 2019 15:38:52 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 24
 Jun 2019 15:38:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 24 Jun 2019 15:38:52 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OKcqeD087798;
        Mon, 24 Jun 2019 15:38:52 -0500
Subject: Re: [PATCH 0/3] Add HwSpinlock support for TI K3 SoCs
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>
References: <20190531021321.14025-1-s-anna@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <90211f72-7ce4-94e5-aef7-bbe14266dfbb@ti.com>
Date:   Mon, 24 Jun 2019 15:38:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531021321.14025-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Bjorn,

On 5/30/19 9:13 PM, Suman Anna wrote:
> Hi Bjorn,
> 
> The following series adds the support for the HwSpinlock IP present
> on the newer TI K3 AM65x and J721E SoCs. The first 2 patches are
> related to the K3 support, and the last patch is a minor debug related
> trace to see the number of locks registered on each SoC.
> 
> I will be posting the DT nodes once the binding is acked.

If you do not have any comments, can you please pick up this series for
5.3 merge window?

Thanks,
Suman

> 
> regards
> Suman
> 
> Suman Anna (3):
>   dt-bindings: hwlock: Update OMAP binding for TI K3 SoCs
>   hwspinlock/omap: Add support for TI K3 SoCs
>   hwspinlock/omap: Add a trace during probe
> 
>  .../bindings/hwlock/omap-hwspinlock.txt       | 25 +++++++++++++++----
>  drivers/hwspinlock/Kconfig                    |  2 +-
>  drivers/hwspinlock/omap_hwspinlock.c          |  4 +++
>  3 files changed, 25 insertions(+), 6 deletions(-)
> 

