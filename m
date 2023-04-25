Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 148386EE454
	for <lists+linux-omap@lfdr.de>; Tue, 25 Apr 2023 16:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233799AbjDYO4j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Apr 2023 10:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbjDYO4j (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Apr 2023 10:56:39 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88EC0185
        for <linux-omap@vger.kernel.org>; Tue, 25 Apr 2023 07:56:37 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33PEuKrL100843;
        Tue, 25 Apr 2023 09:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1682434580;
        bh=j9QzhfzHgzHHTnVG6wcU45QBGcNfYWVGJESWDthMYPY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Xu5OihIBTOJu/mdo/WPCM6kW76zgWTzwKQARtJZVgmmPfu9TNtSLXJ7z/NWuPjUe2
         EJwN4F9vHLLLyLa3PuTEqglDC2v+W+lUvBg8m2xxV0mtb8WYgzT3WXDozeunJmCCpQ
         sHDD/tJW4U0LluIrOfHUhnKp03VEl49nrKTGWfkw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33PEuKsT017027
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Apr 2023 09:56:20 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 25
 Apr 2023 09:56:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 25 Apr 2023 09:56:19 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33PEuAWB027801;
        Tue, 25 Apr 2023 09:56:20 -0500
Date:   Tue, 25 Apr 2023 09:56:10 -0500
From:   Reid Tonking <reidt@ti.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     <tony@atomide.com>, <vigneshr@ti.com>, <aaro.koskinen@iki.fi>,
        <jmkrzyszt@gmail.com>, <linux-omap@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH] i2c: omap: Fix standard mode false ACK
 readings
Message-ID: <20230425145610.j3ljepycclr3i42t@reidt-t5600.dhcp.ti.com>
References: <20230424195344.627861-1-reidt@ti.com>
 <20230425124549.kdvfyvuy4uolvsr2@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230425124549.kdvfyvuy4uolvsr2@intel.intel>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Andi,

On 14:45-20230425, Andi Shyti wrote:
> Hi Reid,
> 
> On Mon, Apr 24, 2023 at 02:53:44PM -0500, Reid Tonking wrote:
> > Using standard mode, rare false ACK responses were appearing with
> > i2cdetect tool. This was happening due to NACK interrupt triggering
> > ISR thread before register access interrupt was ready. Removing the
> > NACK interrupt's ability to trigger ISR thread lets register access
> > ready interrupt do this instead.
> > 
> > Fixes: 3b2f8f82dad7 ("i2c: omap: switch to threaded IRQ support")
> > 
> > Signed-off-by: Reid Tonking <reidt@ti.com>
> 
> please don't leave any space between Fixes and SoB.
> 
> Add also:
> 
> Cc: <stable@vger.kernel.org> # v3.7+
> 
> and Cc the stable list.
> 
> Andi
>

Thanks for the feedback, I'll make that change going forward.

-Reid
