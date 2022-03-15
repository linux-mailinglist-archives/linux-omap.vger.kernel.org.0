Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B53CE4DA456
	for <lists+linux-omap@lfdr.de>; Tue, 15 Mar 2022 22:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351825AbiCOVIS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Mar 2022 17:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343868AbiCOVIP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Mar 2022 17:08:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6492483AC;
        Tue, 15 Mar 2022 14:07:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A83060FDC;
        Tue, 15 Mar 2022 21:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B742DC340E8;
        Tue, 15 Mar 2022 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647378421;
        bh=NiKlQ4AlEgc5TLAFPoW4tC6zwEcBuwoyPhrWAhvkRqk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mdj1N6KluB1jAwn2cVFH37tkUHTnfIvn23n86c/LzGumrNO2srBLGoqx6nTqIpsw9
         WNPFx33VqkrFUMXZ/Hym5t4UsbKC4ceojUiDyRLUpwtPYv5tfUTBeHY5sOaVD4pQ3E
         1vyq9Ugi0bbcPlnAf9AUaOzyIjz3VLm8S4OcIRAYhP5tlHyB3mVD4sRkpz/z/Uivio
         Rij4DttkjXZX/sxzoSb04LSEvk3QpSlLW81jZsO0XrAr715rJBC9K9qTWiYdC2Oak9
         YFlR0CFfhsM3h22c8a0kIpS2/sq4m9l+TlOur4ZYBQSuPmhjtHc+sRVHQrhRTV7oXC
         kcNyPQnKJEEdw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YixRREMd+t1tbbwC@atomide.com>
References: <20220203085618.16043-1-tony@atomide.com> <20220311033617.5712AC340EE@smtp.kernel.org> <YixRREMd+t1tbbwC@atomide.com>
Subject: Re: [PATCH 0/3] Drop TI compatibility clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>
Date:   Tue, 15 Mar 2022 14:06:59 -0700
User-Agent: alot/0.10
Message-Id: <20220315210701.B742DC340E8@smtp.kernel.org>
X-Spam-Status: No, score=-8.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URG_BIZ autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-03-11 23:52:36)
> * Stephen Boyd <sboyd@kernel.org> [220311 03:34]:
> > Quoting Tony Lindgren (2022-02-03 00:56:15)
> > > Hi all,
> > >=20
> > > In order to prepare the TI clocks for fixing lots of devicetree warni=
ngs,
> > > let's first drop the now unused compatibility clocks.
> > >=20
> > > The dra7 changes depend on my still pending omap-for-v5.17/fixes-not-=
urgent
> > > pull request that did not make it for v5.17-rc series so far.
> > >=20
> >=20
> > What should I do with this one though?
>=20
> Well the dependencies are now merged to the mainline kernel, so you could
> merge in commit 31aa7056bbec, then apply this series if otherwise OK.
>=20
> Commit 31aa7056bbec is based on the old v5.16-rc1. It would bring few oth=
er

Ok. Looks like I can merge v5.17-rc4 and then apply these patches. I'll
do that now. Thanks!
