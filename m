Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1FE7EFED0
	for <lists+linux-omap@lfdr.de>; Sat, 18 Nov 2023 11:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjKRKG5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 18 Nov 2023 05:06:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjKRKG4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 18 Nov 2023 05:06:56 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAFAD71
        for <linux-omap@vger.kernel.org>; Sat, 18 Nov 2023 02:06:53 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A807AC433C7;
        Sat, 18 Nov 2023 10:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700302013;
        bh=D20eX3kAOzsYMVmXN55tMS6aMwqF1t9X07PsAzLwSnU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pnhxdUeyyMevW6TjVYlxtHrbGX8cc1gAAXEl9G5Gw5Ht1QmHnWDbO5auzF2e5EiKh
         pruSqHwm/9IlBB0Fj0wmzSrmWsIgQyJ8YIUGpTzm3UDD5FoBx/hAl1n6Hoc/EqkrHg
         vE9OPcFQwpZEL0voDlI63bSG9TRo6WqCps+ymdz2umCxcqh1eFxXuKFXJjxCkX6sPD
         eW+S/6OfrU7iZL7akW29L18NisU0Y8ayENproyilBIL0vgh7jFfgDjJ9d53rXA0lEs
         0f4DDvCcpLQ7GEZYJ4RtGYXO6gl8cyKoAoEKmETSHP5R/hYA+Twz9qokirPqToBDck
         0gS7Lnn1pk0uQ==
Message-ID: <24c7b507-f5f5-4b67-8bc3-d70f781c21c8@kernel.org>
Date:   Sat, 18 Nov 2023 12:06:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] net: ethernet: ti: cpsw-new: Convert to platform
 remove callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Siddharth Vadapalli <s-vadapalli@ti.com>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Yunsheng Lin <linyunsheng@huawei.com>,
        Marek Majtyka <alardam@gmail.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org, kernel@pengutronix.de
References: <20231117091655.872426-1-u.kleine-koenig@pengutronix.de>
 <20231117091655.872426-7-u.kleine-koenig@pengutronix.de>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20231117091655.872426-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 17/11/2023 11:17, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Roger Quadros <rogerq@kernel.org>
