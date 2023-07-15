Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2A3754CB2
	for <lists+linux-omap@lfdr.de>; Sun, 16 Jul 2023 00:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjGOWKX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 15 Jul 2023 18:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbjGOWKW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 15 Jul 2023 18:10:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652212726;
        Sat, 15 Jul 2023 15:10:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 02A4860C56;
        Sat, 15 Jul 2023 22:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA487C433C9;
        Sat, 15 Jul 2023 22:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689459020;
        bh=Jd9MzyCNjvrdhHyp0jt7uhMJ31aCXnfMCKMeGTA8M4I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EX4Q5c5K0T5LCF0I/zVVfPT4pNYDlGVAP0cdL4gTqif5gf6hFiMSlLw4ubNVQfcZG
         xf/0qHk0GzjdYxccsch0uBaI4pd/i5yHzq/SIyxckczRssBjLhYZFQHy7Nwlwif9kD
         zwZi0PffjjwJ2Nx82FPP637TIO2D1khbK6N7krazl3hYiAZ2dNNmGXuAg4Dj5oC6nq
         vpohLZeRLXpbq3FuYKMabjA0PYjt/7ggrpI0ztjLMDrXtRxzClYe8bmEwrmUjcYRSt
         8vIKGdX4gaDe0wjGt2oNzB8KhDnrjqyZq3YNJp82RRG2l9p3LKauld5sN9eua4p59S
         uKARgTk/lV7rg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] hwspinlock: Convert to platform remove callback returning void
Date:   Sat, 15 Jul 2023 15:13:35 -0700
Message-ID: <168945921471.1805013.10154599886454244230.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
References: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Tue, 14 Mar 2023 19:00:20 +0100, Uwe Kleine-König wrote:
> this patch series adapts the platform drivers below drivers/hwspinlock to use
> the .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> [...]

Applied, thanks!

[1/3] hwspinlock: omap: Emit only one error message for errors in .remove()
      commit: 72a3a509f992b6bd182b3380913fe7b4f801075f
[2/3] hwspinlock: omap: Convert to platform remove callback returning void
      commit: 4cf16b6b743e0bbe3128cf97a193ee37110d597b
[3/3] hwspinlock: u8500: Convert to platform remove callback returning void
      commit: 9519793bb6a731a3dd2453ad8515e8866e84c48e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
