Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E26C47A90
	for <lists+linux-omap@lfdr.de>; Mon, 17 Jun 2019 09:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbfFQHPF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Jun 2019 03:15:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51494 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfFQHPF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Jun 2019 03:15:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5H7F2sh045275;
        Mon, 17 Jun 2019 02:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560755702;
        bh=1KiWNol22bOYzL01WVy0sgNUkt47J5o6+/RPRsqVDlc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PkNPQh9JiJLF2L4LhcXUt2uveSVgOsls62y6XhwFUgsaf73c61j0d+CqocqP0Azz0
         NvaLWILitMmJu2iR1EzjDfjE++A2q+fzBvcqvNWhzSCPgOSHSlaAaj9pTyW6xrfE/K
         CRmB1SRUUj11VxGrT8fqYnapP/UZw4cXzm+Ps4SQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5H7F2SO123976
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 17 Jun 2019 02:15:02 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 17
 Jun 2019 02:15:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 17 Jun 2019 02:15:02 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5H7F0r4016991;
        Mon, 17 Jun 2019 02:15:00 -0500
Subject: Re: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v5.3 merge window
To:     Lee Jones <lee.jones@linaro.org>
CC:     <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>
References: <20190612144620.28331-1-j-keerthy@ti.com>
 <20190617070341.GC16364@dell>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <2a3240e2-75f5-ef87-8fa7-0162a84fb590@ti.com>
Date:   Mon, 17 Jun 2019 12:45:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190617070341.GC16364@dell>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 17/06/19 12:33 PM, Lee Jones wrote:
> Enjoy!
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>    Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-regulator-v5.3
> 
> for you to fetch changes up to 7ee63bd74750a2c6fac31805ca0ac67f2522bfa5:
> 
>    regulator: lp87565: Add 4-phase lp87561 regulator support (2019-06-17 08:00:24 +0100)
> 
> ----------------------------------------------------------------
> Immutable branch between MFD and Regulator due for the v5.3 merge window
> 
> ----------------------------------------------------------------
> Keerthy (3):
>        dt-bindings: mfd: lp87565: Add LP87561 configuration
>        mfd: lp87565: Add support for 4-phase LP87561 combination
>        regulator: lp87565: Add 4-phase lp87561 regulator support

Thanks Lee Jones.

> 
>   Documentation/devicetree/bindings/mfd/lp87565.txt | 36 +++++++++++++++++++++++
>   drivers/mfd/lp87565.c                             |  4 +++
>   drivers/regulator/lp87565-regulator.c             | 17 ++++++++++-
>   include/linux/mfd/lp87565.h                       |  2 ++
>   4 files changed, 58 insertions(+), 1 deletion(-)
> 
