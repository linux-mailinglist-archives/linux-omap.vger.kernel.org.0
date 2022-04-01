Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06AAF4EED24
	for <lists+linux-omap@lfdr.de>; Fri,  1 Apr 2022 14:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345416AbiDAMad (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Apr 2022 08:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241810AbiDAMac (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Apr 2022 08:30:32 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCD3BCB8;
        Fri,  1 Apr 2022 05:28:42 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 5F5CA3201E3E;
        Fri,  1 Apr 2022 08:28:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 01 Apr 2022 08:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=jtNk93FHUU49ZARhas5dzjR17GmPtHtxE5P78n
        7e4qc=; b=o+KidCfPuXcoLyv+Uu2vlONlM4XZ6M55f9+nk1/hTQMnYR8FSEQ01d
        8pc2iOrb73MxEhbDT9W135wNdLh5DVxqF97o3HD+9d26a6uZD0tfU1p15X5H9sps
        h6S1AJJCUsjiyRFF3XSpJHPwto0zttTcmkL+1mVp26T0OqVqicnoIBsJIOYAHb4D
        Z0X1QAXES4H5/sh2xaE4i4+BZWvOeZJTp32E3p40yo/IjVW3iS5sZLMA7IUZJs3P
        zVhA6vF5JECgy0VOZuBCg3Fywd8mu+8QrmDlwx80EcBwjmQ4gsOeh+y0iaxYGOEt
        +Y22Gxbm24YjH58TU1kIUt+E+tPZ7P5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jtNk93FHUU49ZARha
        s5dzjR17GmPtHtxE5P78n7e4qc=; b=Qm+M5EF2/a5lVwE2HRiKOiZo5kfbV7lJk
        Zz7MQ8AfLwEnc6JABD/G8GjiikqpZ5vZZL1VZiKuldP1yWGGgNCNRAo+4yusqqQa
        Z1wyNkIqDdV52BFrJa3jVYQkosN1sOer2xUhEAD2KisfWN8FY0m1Q7vsY98tjX8n
        wJ+gl+OVRpPocHhHogU+Iq1pWKF4UiSVwmUJMwnrxWDvcD4D2NrV7WmjMLDy58E2
        z4NNNQywCL/PfwjeSi4lsmrzh948McNuRPmYFYVcekxIz3c7YAFKuZ5RFoxJQsab
        m9fsrcWpalPL11D5PAy8gVfTW+f54Ts6DVZejOtTMHDbo4f+wfjAA==
X-ME-Sender: <xms:-O9GYkmW_6Xi1wicatTk-82c-4Y0wXgkhdO1NFoyejkMuGL3AAUGWQ>
    <xme:-O9GYj2vGnDh54tGvbuBZaFuDHcWhQxfUB9VVrktt5aqqKGfazlkAGb-Opa4LneIx
    NbGFe8zQm2KJp4oy3A>
X-ME-Received: <xmr:-O9GYirDaR5o8pLL5wj7VPVKNQkSELRO_q8icgIwd6RJy_qlJ3gEWyoMLyzIOy8uLoIJxgDigq1oLbtuUfbfGEtG-no-QBKNjHuhTSE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-O9GYglB-5N3pyIem_3UIEv6oYtQ53qQgiGaj1Qabs7pgU-YV8qxwQ>
    <xmx:-O9GYi2L-LwYeUTf5uf6FNsw6kACVIkCHBoT9rwRbtXHC0F1H27eQg>
    <xmx:-O9GYntMQJfPL0sxzqZE1gER1JPc42iCOxZtPfAZeiOLJldl43H3PQ>
    <xmx:-O9GYjLKF_Pnv9UT4HDypdbsS1ch46HJi5bE8LdqeN9yEa2NOak57A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 08:28:40 -0400 (EDT)
Date:   Fri, 1 Apr 2022 14:28:39 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <20220401122839.nn74rtftvzgjqjrg@houat>
References: <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
 <20220331095456.dyyxsiu2b3yw2vvs@houat>
 <YkXCGlrok0niwlyg@atomide.com>
 <20220331153134.h3alp24hzquajkly@houat>
 <YkXeGS5zaovOaEzp@atomide.com>
 <20220331215818.F11BEC340F0@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cbzadlu2wn45hprg"
Content-Disposition: inline
In-Reply-To: <20220331215818.F11BEC340F0@smtp.kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--cbzadlu2wn45hprg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 31, 2022 at 02:58:17PM -0700, Stephen Boyd wrote:
> Quoting Tony Lindgren (2022-03-31 10:00:09)
> > * Maxime Ripard <maxime@cerno.tech> [220331 15:29]:
> > > On Thu, Mar 31, 2022 at 06:00:42PM +0300, Tony Lindgren wrote:
> > > > * Maxime Ripard <maxime@cerno.tech> [220331 09:52]:
> > > > > On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> > > > > > It seems the dts assigned-clock-parents no longer works now?
> > > > >=20
> > > > > That would make some kind of sense, __set_clk_parents calls clk_p=
ut on
> > > > > both the assigned clock and its parent.
> > > > >=20
> > > > > Could you see what parent (and why?) it tries to enforce then?
> > > >=20
> > > > It picks the other option available for the mux clock that only has
> > > > two options. No idea why, but if you have some debug patch in mind I
> > > > can give it a try.
> > > >=20
> > > > > It looks like the gpt1_fck driver might favor another parent for =
that
> > > > > rate, which, if it's an invalid configuration, shouldn't really h=
appen?
> > > >=20
> > > > Hmm there's a gate clock and a mux clock, there's not really a rate
> > > > selection available here for the sources.
> > >=20
> > > If I followed the OMAP driver properly, clk_mux_determine_rate_flags =
is
> > > doing the heavy lifting, could you run your test with
> >=20
> > Thanks that produces some interesting output. In the working case with
> > the $subject patch reverted we have:
>=20
> I don't think clk_put() dropping a range request is very important right
> now. If this isn't fixed tomorrow then we should revert out this patch
> so systems can boot -rc1 and try to fix it in parallel.

Yeah, it can definitely be reverted. I'm not so sure that the issue is
with this patch itself though but more that it now triggers a fault
reliably.

Maxime

--cbzadlu2wn45hprg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkbv9gAKCRDj7w1vZxhR
xS1lAQDlzhXShXYyvRXWBAMz9rbYVpXxhlVfXcSkFRoybpK0agD8D6P1JMu8K2kP
6PnQ5mQa5YSBF/ZysmWXUJksfhpk+wc=
=0WDl
-----END PGP SIGNATURE-----

--cbzadlu2wn45hprg--
