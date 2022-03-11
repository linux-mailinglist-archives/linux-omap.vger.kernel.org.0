Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 897E84D592E
	for <lists+linux-omap@lfdr.de>; Fri, 11 Mar 2022 04:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238944AbiCKDhW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Mar 2022 22:37:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbiCKDhV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Mar 2022 22:37:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E8F13C39F;
        Thu, 10 Mar 2022 19:36:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9D15FB82A09;
        Fri, 11 Mar 2022 03:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5712AC340EE;
        Fri, 11 Mar 2022 03:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646969777;
        bh=O3R6bSOedl+qgvgkLo7GLoSPK+/4Iyazj7tBF2rtkWc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uh3E2bKj0fftfZiYuB+9giOgnzFY1pHFWh12DvtY8kDcISqRmpjOQQhWVzn5ByHX6
         TBiGWuto8BeFZjUtUpgiCyjK8yTuJshfP4abDlJw/pAlAVp682ngJkzByicyRQMywO
         OE8sIk/KyMMPFV3pIekql4RJcX0+SSsAVXxR1bFPhnlHlWnj573h1TrRGwPmR4wE1K
         MGAj4rO1KfMUzVKl2vhRppt/uSn5LML1KQa9p3wghuY0PlcDVouYtGQq57TnvyDogH
         /wrkQS/9MdjO2CQ38+hWoHoeC7t6Yw+m3SErh91ypMsyflDq0gjqO6oC9nAtM5FyO/
         NX4gAvtGsXbnA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220203085618.16043-1-tony@atomide.com>
References: <20220203085618.16043-1-tony@atomide.com>
Subject: Re: [PATCH 0/3] Drop TI compatibility clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Thu, 10 Mar 2022 19:36:15 -0800
User-Agent: alot/0.10
Message-Id: <20220311033617.5712AC340EE@smtp.kernel.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URG_BIZ autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-03 00:56:15)
> Hi all,
>=20
> In order to prepare the TI clocks for fixing lots of devicetree warnings,
> let's first drop the now unused compatibility clocks.
>=20
> The dra7 changes depend on my still pending omap-for-v5.17/fixes-not-urge=
nt
> pull request that did not make it for v5.17-rc series so far.
>=20

What should I do with this one though?
