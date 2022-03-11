Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64DDB4D5924
	for <lists+linux-omap@lfdr.de>; Fri, 11 Mar 2022 04:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346193AbiCKDdv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Mar 2022 22:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346338AbiCKDc6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Mar 2022 22:32:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F51FBA4A;
        Thu, 10 Mar 2022 19:31:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B2D6FB82A0A;
        Fri, 11 Mar 2022 03:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7BDC340EC;
        Fri, 11 Mar 2022 03:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646969483;
        bh=we8U5VPOWvug58XQa0Zr6jucknRVaa+zCZLPU3etEzA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sCA+QLWDMPe4eM++nBaIlIe9GX2m+s0eYHHcrzUssFim7eBHJWPoK5ULMrON5gXqZ
         UKPh7zGucHIYZnsHMKOo+ni+zUUaPgcUmV3SU3wmw2RbFk5kolV327njqLgVF7C2GO
         Gmu/3CyGypyx65mOyqsOsRHOEjXy5RYptUrgYuyoRmZTtL7Qs6Y+XfbtWAf8LeWH4l
         TCsVjCuM11vGQf9ujZlttFtSxcpYUYWNmG+AwYwIvjTj+xgq/5EGTLuWqBYmQqajxN
         SuQmNRErjQyPHKFz0XyN9ac/15w/gONe0CWxUh5eAJOfpFHzguqV5wtyMwVebbx9cr
         4L/8IWKi/BAAg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220204071449.16762-5-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com> <20220204071449.16762-5-tony@atomide.com>
Subject: Re: [PATCH 4/8] clk: ti: Add ti_find_clock_provider() to use clock-output-names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Thu, 10 Mar 2022 19:31:21 -0800
User-Agent: alot/0.10
Message-Id: <20220311033123.5F7BDC340EC@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-03 23:14:45)
> Let's add ti_find_clock_provider() so we can use clock-output-names
> to name the clock provider instead of relying on non-standard devicetree
> node names.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-next
