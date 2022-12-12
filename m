Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1747649967
	for <lists+linux-omap@lfdr.de>; Mon, 12 Dec 2022 08:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbiLLHQx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Dec 2022 02:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbiLLHQv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Dec 2022 02:16:51 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 057897665;
        Sun, 11 Dec 2022 23:16:51 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 539E080B3;
        Mon, 12 Dec 2022 07:16:50 +0000 (UTC)
Date:   Mon, 12 Dec 2022 09:16:49 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v9 1/2] memory: omap-gpmc: wait pin additions
Message-ID: <Y5bVYZu+nFGRpE4K@atomide.com>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
 <20221102133047.1654449-2-benedikt.niedermayr@siemens.com>
 <Y5CafQpZnjSSCMoj@atomide.com>
 <ae35cfd12ed3472df20ca5f99bffa8bb7c009199.camel@siemens.com>
 <Y5CsDefg12Bbg24p@atomide.com>
 <cf36d335dc6a85ebafc765a4d806745cca62362a.camel@siemens.com>
 <Y5F69xtIPM87iklg@atomide.com>
 <b72c7b7aa5978100c2e925cf7386e2ecdb39aa5c.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b72c7b7aa5978100c2e925cf7386e2ecdb39aa5c.camel@siemens.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Niedermayr, BENEDIKT <benedikt.niedermayr@siemens.com> [221208 15:55]:
> No need for dts changes. One concern for the wait-pin implementation was to
> not break existing dts's where the wait-pin is not used.   

OK thanks.

Tony
