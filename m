Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428E8D22E2
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 10:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733173AbfJJIeZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 04:34:25 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40814 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728388AbfJJIeZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 04:34:25 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A8YLtM104967;
        Thu, 10 Oct 2019 03:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570696461;
        bh=J8lFpRpTZt0UWrpkSdB7wZlOFZyeC3GH86jdS3JymcA=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=lXhnj768xcp1mqlfcDwQNunW8F6a08sXPjJEW4pB1qpqVm7O8h3EBMa5XYZFEv9oL
         mc4LsUbpw9S4dGhqVszofz3LzhIIR9yo3sKxfsh7WjnT9xRDMDj1Z5a7mM1Hj0ua+A
         BMEfW30fs1VFOqlWh9RxoZ3DvevW9m6AneG7J+dQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A8YLAo023613
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Oct 2019 03:34:21 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 03:34:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 03:34:21 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A8YJYO023196;
        Thu, 10 Oct 2019 03:34:19 -0500
Subject: Re: [PATCHv3 00/10] clk: ti: remoteproc / iommu support patches
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
Message-ID: <ef764d1c-8ebc-4b64-4543-7b296327e197@ti.com>
Date:   Thu, 10 Oct 2019 11:34:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912132613.28093-1-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/09/2019 16:26, Tero Kristo wrote:
> Hi,
> 
> V3 of this series sort of reverted back to pretty much V1 which expects
> strict sequencing of events from the bus driver. This one doesn't have
> any dependency towards the reset driver either, and the controversial
> reset handling APIs have been removed.
> 
> -Tero

Stephen, any comments on this one or shall I just craft a pull-request 
for this and rest of the TI clock driver changes towards 5.5? There 
seems to be a pile of them coming this time over...

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
