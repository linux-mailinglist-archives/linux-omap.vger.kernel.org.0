Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 447964D5921
	for <lists+linux-omap@lfdr.de>; Fri, 11 Mar 2022 04:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346156AbiCKDdu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Mar 2022 22:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346252AbiCKDcw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Mar 2022 22:32:52 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7C7F4052;
        Thu, 10 Mar 2022 19:31:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E66E1B82A07;
        Fri, 11 Mar 2022 03:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A2CC340EC;
        Fri, 11 Mar 2022 03:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646969493;
        bh=5TJinI2C8QQU3w0cFgu6WKJj51paGaruf342c+Hd2sA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hLyCJDIZtpuwZhvT/rbNPXibtVraYr3v2RHMsyQBPXQDpHZc0UYXDXHgTbhyIOLtG
         QjpGK0Eu7+QXZke52NKpauZR6IhVYRLm4tCk0SQjmR3tpUFanTnzRzdNn0Z6mLtKax
         4UzY1K6kd/R7gNSVWpKrO8FQ+PFiEkgXsw+js+DENJ6E6PX491f/lNi2h3vyUFRXD5
         nUkTBSFQIRqjXxaJ5g+uHK02NBHMEZwfvZww/e2vP/D+ifMnF11ATTPt5Hxs8qIfrT
         T5Q15We2SIvvEPhK0HwbAOAtApyXqx7OSSeBk9fr05AyINVTkq8FIDTlIEa3hr3M+N
         PIRgw2sNueAHw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220204071449.16762-6-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com> <20220204071449.16762-6-tony@atomide.com>
Subject: Re: [PATCH 5/8] clk: ti: Use clock-output-names for clkctrl
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Thu, 10 Mar 2022 19:31:31 -0800
User-Agent: alot/0.10
Message-Id: <20220311033133.85A2CC340EC@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-03 23:14:46)
> Use clock-output-names devicetree property for clkctrl clocks if
> available.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-next
