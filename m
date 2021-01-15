Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B4C2F80FA
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 17:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbhAOQjV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jan 2021 11:39:21 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50640 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbhAOQjV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Jan 2021 11:39:21 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10FGcXss005195;
        Fri, 15 Jan 2021 10:38:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1610728713;
        bh=wZQyTzD4KHELT+ZdhYxfwSJ38y+1CC1synxgDs8UPD8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ngsAgzkoNdxHP9ir5eBRVRJn2QRI4cKo5lE073rNIcSJ5VEgv+HaOYjlgjr8DCmWh
         VdEz2LCPFx4ehyBkNAszqYg3Y0DqjNFYuGiFsGZa4kPpIkRUKk2FBLx6rrv66Ym1Cj
         yzdxcI1cNE0euuTbyGc1wj/paQ+KE+F8Kzznh42s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10FGcXtr088735
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 Jan 2021 10:38:33 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 Jan 2021 10:38:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 Jan 2021 10:38:32 -0600
Received: from [10.250.34.42] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10FGcWG4069644;
        Fri, 15 Jan 2021 10:38:32 -0600
Subject: Re: [PATCH] dt-bindings: soc: ti: Update TI PRUSS bindings about
 schemas to include
To:     <santosh.shilimkar@oracle.com>
CC:     Rob Herring <robh@kernel.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
        <ssantosh@kernel.org>, <praneeth@ti.com>, <lee.jones@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20201216225027.2681-1-grzegorz.jaszczyk@linaro.org>
 <20201221213234.GA596829@robh.at.kernel.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <6f5b6609-bb9e-31f7-c0c2-3bb261a54d6a@ti.com>
Date:   Fri, 15 Jan 2021 10:38:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201221213234.GA596829@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Santosh,

On 12/21/20 3:32 PM, Rob Herring wrote:
> On Wed, 16 Dec 2020 23:50:27 +0100, Grzegorz Jaszczyk wrote:
>> Now after ti,pruss-intc.yaml and ti,pru-rproc.yaml are merged, include
>> them in proper property and extend the examples section.
>>
>> At the occasion extend the allowed property list about dma-ranges.
>>
>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>> ---
>>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  | 76 +++++++++++++++++++
>>  1 file changed, 76 insertions(+)
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Gentle reminder, I haven't seen this patch yet on linux-next.
Can you please pick this up for 5.12.

Thanks,
Suman


