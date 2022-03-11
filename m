Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 451394D591E
	for <lists+linux-omap@lfdr.de>; Fri, 11 Mar 2022 04:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346174AbiCKDci (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Mar 2022 22:32:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345989AbiCKDcc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Mar 2022 22:32:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5356EF8BB8;
        Thu, 10 Mar 2022 19:31:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A43036158F;
        Fri, 11 Mar 2022 03:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC68C340EC;
        Fri, 11 Mar 2022 03:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646969472;
        bh=CNt81WhQLFTt4EwXXvJzeGFyt58Bp9ql/ujY7D5nWFs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=h/KMLj2CBuYqSDUlHW88e16Y1JNFAnUdzNi2b8IQAuXG74XqJrXVYIjPLLNdU3JlO
         W9IX1El5qMZ2qjKzU9iSyStwBmhiMAWwJJ/N4vIuGrFk29WuOSQEpCLPOJ7CcHLs6V
         nZqiZ3ym/yJnz0RhsyKZM5ehGiff/e1PQBhH3wu+9X7Guh5wSxBdCNGsi2lJROFNFf
         3SCEAxkEY2yV44y6KHzNopjA5EylsZqNjV4/VRF0CA2lJmQZ3IvTlK85ldcslDnTsh
         dZqbYCY4FMHM0d5wgfA9DQ81qkwLvnEGEt/v/7SMG0TriJ0GpATEt3m3o+Ga6xHm4j
         yaS4W+x7tXA5g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220204071449.16762-4-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com> <20220204071449.16762-4-tony@atomide.com>
Subject: Re: [PATCH 3/8] clk: ti: Optionally parse IO address from parent clock node
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Thu, 10 Mar 2022 19:31:10 -0800
User-Agent: alot/0.10
Message-Id: <20220311033112.0CC68C340EC@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-03 23:14:44)
> If no reg property is specified for a TI clock, let's try to use the
> parent clock node IO address. This way we can avoid duplicate devicetree
> reg properties that cause warnings for unique_unit_address.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-next
