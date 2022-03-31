Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD8A4EE3AB
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 23:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240570AbiCaWAN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 18:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242185AbiCaWAM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 18:00:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61664C30;
        Thu, 31 Mar 2022 14:58:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 59C2CB82256;
        Thu, 31 Mar 2022 21:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11BEC340F0;
        Thu, 31 Mar 2022 21:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648763899;
        bh=EdyYRv/RjH6voZpfK9AsnGWVtEgWXeOuukdtRC5UEKg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lnycOEjlNdrSNQz4HWAciAAwYkiads1HaoBhzmckHhiGEx2FVc8VApvNG/U9fZnlr
         7/clOK8vr/mk4bbIw/imRUg8mKlFLGoy3cP6lF6pfy8pQFAN9CSbTGH1aF7rXWFAwC
         5eUCCuB8MPWi+ft9NaYXhMPh7WIgoijxWXzG3EvDuKREPSLVRmVUmawgEWVWzGnPN6
         jdqsO4KjIYszy0jIQDN2bn/8Iq5wsP06a7Dx2wzyA5cDIyvc9MJaYk0dnifJpTE+yM
         7DMl4xqMVdY5x0jyrH5A50uRGYv52Ykkt6t2QK5+3Hwm5mVrzYernar930y/vMNyzw
         Uhg6D24iOoTWQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YkXeGS5zaovOaEzp@atomide.com>
References: <20220325161144.1901695-1-maxime@cerno.tech> <20220325161144.1901695-4-maxime@cerno.tech> <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com> <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com> <20220330084710.3r6b5pjspz5hdmy6@houat> <YkV3ch7R7YxlATW+@atomide.com> <20220331095456.dyyxsiu2b3yw2vvs@houat> <YkXCGlrok0niwlyg@atomide.com> <20220331153134.h3alp24hzquajkly@houat> <YkXeGS5zaovOaEzp@atomide.com>
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     Maxime Ripard <maxime@cerno.tech>, Tony Lindgren <tony@atomide.com>
Date:   Thu, 31 Mar 2022 14:58:17 -0700
User-Agent: alot/0.10
Message-Id: <20220331215818.F11BEC340F0@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-03-31 10:00:09)
> * Maxime Ripard <maxime@cerno.tech> [220331 15:29]:
> > On Thu, Mar 31, 2022 at 06:00:42PM +0300, Tony Lindgren wrote:
> > > * Maxime Ripard <maxime@cerno.tech> [220331 09:52]:
> > > > On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> > > > > It seems the dts assigned-clock-parents no longer works now?
> > > >=20
> > > > That would make some kind of sense, __set_clk_parents calls clk_put=
 on
> > > > both the assigned clock and its parent.
> > > >=20
> > > > Could you see what parent (and why?) it tries to enforce then?
> > >=20
> > > It picks the other option available for the mux clock that only has
> > > two options. No idea why, but if you have some debug patch in mind I
> > > can give it a try.
> > >=20
> > > > It looks like the gpt1_fck driver might favor another parent for th=
at
> > > > rate, which, if it's an invalid configuration, shouldn't really hap=
pen?
> > >=20
> > > Hmm there's a gate clock and a mux clock, there's not really a rate
> > > selection available here for the sources.
> >=20
> > If I followed the OMAP driver properly, clk_mux_determine_rate_flags is
> > doing the heavy lifting, could you run your test with
>=20
> Thanks that produces some interesting output. In the working case with
> the $subject patch reverted we have:

I don't think clk_put() dropping a range request is very important right
now. If this isn't fixed tomorrow then we should revert out this patch
so systems can boot -rc1 and try to fix it in parallel.
