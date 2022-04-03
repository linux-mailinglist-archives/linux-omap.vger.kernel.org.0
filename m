Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E602D4F06C5
	for <lists+linux-omap@lfdr.de>; Sun,  3 Apr 2022 04:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiDCCQu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Apr 2022 22:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiDCCQu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Apr 2022 22:16:50 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838423A5E9;
        Sat,  2 Apr 2022 19:14:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E4B65CE0B1F;
        Sun,  3 Apr 2022 02:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1296C340EE;
        Sun,  3 Apr 2022 02:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648952094;
        bh=sqYLDU+fwXFcPGJInHBWfYzYzKNM+vXb4OU6AqfFR5Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F1X32ELEee+RI/dSMDPAySBSdLkKwiVKCHLwRK5n527vp3R5wQkhrWukmjZxAJlP2
         G5E8CV1QceJf6wlLaBr8GkYxgSSo4DblLao4ucsvUTOlUCqXCuwAn08wJc/2TCQIWx
         xu+/uC8oWHvbnAscyks5cgG3RW9t68reBjvRU4Bnb6Jj98dxOGlgJe4q4XqUGhPcAB
         P1spjwFMZ2cDzwUey3p6CwFZa8Sf14FWslTuDb317mGx2qudxtihxOWVe6HLyTHYvM
         BjALABzcu1IioUMsOFmHw7UA4djoZsrEAZLEIkWP1G2w17PNsYP5NkKvgoorj+GmIX
         3XcLieuQlXJXA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220401122839.nn74rtftvzgjqjrg@houat>
References: <20220325161144.1901695-4-maxime@cerno.tech> <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com> <20220330084710.3r6b5pjspz5hdmy6@houat> <YkV3ch7R7YxlATW+@atomide.com> <20220331095456.dyyxsiu2b3yw2vvs@houat> <YkXCGlrok0niwlyg@atomide.com> <20220331153134.h3alp24hzquajkly@houat> <YkXeGS5zaovOaEzp@atomide.com> <20220331215818.F11BEC340F0@smtp.kernel.org> <20220401122839.nn74rtftvzgjqjrg@houat>
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Sat, 02 Apr 2022 19:14:51 -0700
User-Agent: alot/0.10
Message-Id: <20220403021453.F1296C340EE@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Maxime Ripard (2022-04-01 05:28:39)
> Hi,
>=20
> On Thu, Mar 31, 2022 at 02:58:17PM -0700, Stephen Boyd wrote:
> >=20
> > I don't think clk_put() dropping a range request is very important right
> > now. If this isn't fixed tomorrow then we should revert out this patch
> > so systems can boot -rc1 and try to fix it in parallel.
>=20
> Yeah, it can definitely be reverted. I'm not so sure that the issue is
> with this patch itself though but more that it now triggers a fault
> reliably.
>=20

I don't see a revert sent yet so I'll send one now.
