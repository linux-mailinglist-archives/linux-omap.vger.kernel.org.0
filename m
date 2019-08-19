Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 833C79519C
	for <lists+linux-omap@lfdr.de>; Tue, 20 Aug 2019 01:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbfHSXUZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 19:20:25 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:32972 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728351AbfHSXUZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 19:20:25 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JNKJpb000863;
        Mon, 19 Aug 2019 18:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566256819;
        bh=tyfJkNHq2EgWFBMlbBdi4Iejj9XMXwAnbWKf48D+V+o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Cbh9+OTQ3s9PsG8tp/r4Zlfp/ZIh5/bSwoQU0OtozakeWlGir8Wc/XtcSfIaXA/AA
         M40fly1jYvRML+drcNTw+xuGQYhtcpDb9+sVpNogCBBTlVunxyPxvqXT9UuG1G9G94
         ecAEoXzn64IzTUDdaYB0yI6UVAbOPPTTJy2hCdFA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JNKJOj002841
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Aug 2019 18:20:19 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 18:20:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 18:20:19 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JNKI6l051111;
        Mon, 19 Aug 2019 18:20:18 -0500
Subject: Re: [PATCH 0/8] soc: ti: Add OMAP PRM driver
To:     Tero Kristo <t-kristo@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <432a70fc-2683-42ca-3ac7-9775efa3ca41@ti.com>
Date:   Mon, 19 Aug 2019 18:20:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

On 8/7/19 2:48 AM, Tero Kristo wrote:
> Hi,
> 
> This series adds OMAP PRM driver which initially supports only reset
> handling. Later on, power domain support can be added to this to get
> rid of the current OMAP power domain handling code which resides
> under the mach-omap2 platform directory. Initially, reset data is
> added for AM3, OMAP4 and DRA7 SoCs.

Wakeup M3 remoteproc driver is fully upstream, so we should be able to
test that driver as well if you can add the AM4 data. That will also
unblock my PRUSS.

If you can add the data to others as well, it will help in easier
migration of the individual drivers, otherwise the ti-sysc interconnect,
hwmod, and hwmod reset data combinations will all have to be supported
in code.

regards
Suman

> 
> I've been testing the reset handling logic with OMAP remoteproc
> driver which has been converted to use generic reset framework. This
> part is a work in progress, so will be posting patches from that part
> later on.
> 
> -Tero
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 

