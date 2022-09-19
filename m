Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472A95BCB09
	for <lists+linux-omap@lfdr.de>; Mon, 19 Sep 2022 13:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiISLsp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Sep 2022 07:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiISLso (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Sep 2022 07:48:44 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9D9502B1A9;
        Mon, 19 Sep 2022 04:48:42 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 65B808050;
        Mon, 19 Sep 2022 11:40:39 +0000 (UTC)
Date:   Mon, 19 Sep 2022 14:48:40 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] dt-bindings: timer: Add power-domains for TI timer-dm on
 K3
Message-ID: <YyhXGFOUHYWV55Kk@atomide.com>
References: <20220919112357.64997-1-tony@atomide.com>
 <aee9384c-b46d-c85b-0ee6-113e6eca8c59@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aee9384c-b46d-c85b-0ee6-113e6eca8c59@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [220919 11:27]:
> On 19/09/2022 13:23, Tony Lindgren wrote:
> > On K3 SoCs, the power-domains property is needed. On the earlier SoCs,
> > the power-domains property is handled by the interconnect target module
> > parent device.
> 
> Rebase your patch on recent Linux kernel and use get_maintainers.pl.

OK sorry about your old email address, noted :)

> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> > Cc: Keerthy <j-keerthy@ti.com>
> > Cc: Nishanth Menon <nm@ti.com>
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks,

Tony
