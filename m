Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B32284FAE
	for <lists+linux-omap@lfdr.de>; Tue,  6 Oct 2020 18:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgJFQQw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Oct 2020 12:16:52 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53480 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726459AbgJFQQw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Oct 2020 12:16:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096GGgaC011030;
        Tue, 6 Oct 2020 11:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1602001002;
        bh=UFFmMIjsLbkm6u1Nw+fPjP2rCdOt20uSXmfcBGEy3GM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fFzvViNR9eLL1iv24zzCKEwq2HC/S6PAbDrnuPvDQ+6rq6jy51aiI7vTJHBiWUQ6p
         TIKsK7Dq66FtNRtq+207B1jAINJBtGoQ0ZzYQUN4W9OS7K9HVMUB+wlFvsP9DOCqN0
         mmGeVB2ivnDhO4rtkdcL6JojPd4nBrU3M1CzbjsI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096GGgVj109613
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 6 Oct 2020 11:16:42 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 11:16:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 11:16:41 -0500
Received: from [10.250.37.92] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096GGfA0117729;
        Tue, 6 Oct 2020 11:16:41 -0500
Subject: Re: [PATCH -next] dt-bindings: hwlock: omap: Fix warnings with
 k3.yaml
To:     Rob Herring <robh@kernel.org>
CC:     Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200928225155.12432-1-s-anna@ti.com>
 <20200930145537.GA2851296@bogus> <20201006155207.GA2297951@bogus>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <8250838c-21fd-1e1a-2a8f-fec0cd363e7f@ti.com>
Date:   Tue, 6 Oct 2020 11:16:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006155207.GA2297951@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/6/20 10:52 AM, Rob Herring wrote:
> On Wed, Sep 30, 2020 at 09:55:37AM -0500, Rob Herring wrote:
>> On Mon, Sep 28, 2020 at 05:51:55PM -0500, Suman Anna wrote:
>>> Update the AM65x HwSpinlock example to fix couple of warnings
>>> that started showing up after the conversion of K3 bindings to
>>> YAML format in commit 66e06509aa37 ("dt-bindings: arm: ti:
>>> Convert K3 board/soc bindings to DT schema").
>>>
>>>  compatible: ['ti,am654'] is not valid under any of the given schemas (Possible causes of the failure):
>>>  compatible: ['ti,am654'] is too short
>>>  compatible:0: 'ti,am654' is not one of ['ti,am654-evm']
>>>
>>> Also, fix one of the node names while at this.
>>>
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> ---
>>>  .../devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml        | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> I guess this isn't dependent on k3.yaml, so I've applied it.

Yes, it is independent. Thanks Rob.

regards
Suman

