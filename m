Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B367059A7BE
	for <lists+linux-omap@lfdr.de>; Fri, 19 Aug 2022 23:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352340AbiHSVX5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Aug 2022 17:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352401AbiHSVXy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 Aug 2022 17:23:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B10331345;
        Fri, 19 Aug 2022 14:23:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D2D33616E4;
        Fri, 19 Aug 2022 21:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DFCC433D6;
        Fri, 19 Aug 2022 21:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660944232;
        bh=BsyawgpcvakoM6sLopG14a5XVExMzcDUvEJpPeQ3XM8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XmSNCUH+PuYbSrjkDuwezDCvk2ZTtz5GzujtaACu/e8EbzLbGefuzOePfWPyQ1GII
         J2XNljDPUs5wzV16yZWn1xpcRK1s6TxMM6Exirvfzf+PwWyLDxTfPPBGjQ96eYZ/GD
         AQXvQKGeTkvFYPRjov5OyuIs2CbnQ6Rir9UgzjbJ3W0ztATqF/DZmUDTrC7UI5gz5w
         nH03IJxaEl7B+56M64HP0/AU5G0neE5Z6TMq1/T3tlv7jWHUKB9JAXiNd/qqqyl+hb
         5wfm6PWH/ZcDIGFJ8uVJ721OH3A0udieBX1xrFEUy/GMpaKReXKC6xDeg14CELjDWJ
         mgYT0iHHfPKUw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220621091118.33930-1-tony@atomide.com>
References: <20220621091118.33930-1-tony@atomide.com>
Subject: Re: [PATCH] clk: ti: Fix missing of_node_get() ti_find_clock_provider()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org
Date:   Fri, 19 Aug 2022 14:23:50 -0700
User-Agent: alot/0.10
Message-Id: <20220819212352.33DFCC433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-06-21 02:11:18)
> For ti_find_clock_provider() we want to return the np with refcount
> incremented. However we are missing of_node_get() for the
> clock-output-names case that causes refcount warnings.
>=20
> Fixes: 51f661ef9a10 ("clk: ti: Add ti_find_clock_provider() to use clock-=
output-names")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-fixes
