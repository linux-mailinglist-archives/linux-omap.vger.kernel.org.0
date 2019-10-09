Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6166FD07A9
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 08:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbfJIGwv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 02:52:51 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59624 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbfJIGwv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 02:52:51 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x996qf77116209;
        Wed, 9 Oct 2019 01:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570603961;
        bh=ELz4phqV0IVr4qbxwKXEXSVLL2qzr2qRxeZLJHyS5tA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hmka772CcFmuERw+ck/csUD1tnEodi65nhVIt9Wk1MybE6PthkIYuwCHfh97PPDpP
         eLotFfTk19YypWiZSL9v4uZ/Mk1X8A81eBz3QDXOP5fpNstHKJtMmTN6EIJ6mataUP
         BlBfMMF0iinPdYcK+2pQmo1paQNTXDMKog0l5o20=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x996qfLC034608;
        Wed, 9 Oct 2019 01:52:41 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 01:52:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 01:52:40 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x996qbmb028779;
        Wed, 9 Oct 2019 01:52:38 -0500
Subject: Re: [PATCHv8 1/9] dt-bindings: omap: add new binding for PRM
 instances
To:     Sebastian Reichel <sre@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>,
        <tony@atomide.com>, <s-anna@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <p.zabel@pengutronix.de>
References: <20191008125544.20679-1-t-kristo@ti.com>
 <20191008125544.20679-2-t-kristo@ti.com>
 <20191008154655.u34wkbqgmelv3aea@earth.universe>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <115ab938-e025-98fa-3b9e-0b3ced39307d@ti.com>
Date:   Wed, 9 Oct 2019 09:52:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008154655.u34wkbqgmelv3aea@earth.universe>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/10/2019 18:46, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Oct 08, 2019 at 03:55:36PM +0300, Tero Kristo wrote:
>> +Example:
>> +
>> +prm_dsp2: prm@1b00 {
>> +	compatible = "ti,omap-prm-inst", "ti,dra7-prm-inst";
> 
> Nit: compatible values are sorted the other way around (most
> specific first).

Hmm right, I would not like to re-post the whole series just for this 
seeing all the acks are in place already.

Santosh, do you want to fix this locally or shall we post a separate 
patch later on to fix this?

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
