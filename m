Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7486468BB
	for <lists+linux-omap@lfdr.de>; Thu,  8 Dec 2022 06:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiLHFtr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Dec 2022 00:49:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiLHFtq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Dec 2022 00:49:46 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AAB9B45A16;
        Wed,  7 Dec 2022 21:49:45 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AF82A804D;
        Thu,  8 Dec 2022 05:49:44 +0000 (UTC)
Date:   Thu, 8 Dec 2022 07:49:43 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v9 1/2] memory: omap-gpmc: wait pin additions
Message-ID: <Y5F69xtIPM87iklg@atomide.com>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
 <20221102133047.1654449-2-benedikt.niedermayr@siemens.com>
 <Y5CafQpZnjSSCMoj@atomide.com>
 <ae35cfd12ed3472df20ca5f99bffa8bb7c009199.camel@siemens.com>
 <Y5CsDefg12Bbg24p@atomide.com>
 <cf36d335dc6a85ebafc765a4d806745cca62362a.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf36d335dc6a85ebafc765a4d806745cca62362a.camel@siemens.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Niedermayr, BENEDIKT <benedikt.niedermayr@siemens.com> [221207 17:29]:
> I found the cause of this bug.
> At least when "gpmc_cs_program_settings: invalid wait-pin (-1)" is printed in the kernel log.

OK

> Now I'm not sure where to send the bugfix patch (linux-next, linux-omap, both?). 

Please send a fix as against current Linux next as a separate patch as
your earlier patches have been already applied for the merge window.

If dts changes are also needed, let's first try to fix the driver to handle
the invalid wait-pin case. Then we can patch the dts files separately as
needed.

Regards,

Tony
