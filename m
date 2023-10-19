Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0B5D7CECFE
	for <lists+linux-omap@lfdr.de>; Thu, 19 Oct 2023 02:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjJSAy5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Oct 2023 20:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjJSAy5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Oct 2023 20:54:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB15118;
        Wed, 18 Oct 2023 17:54:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D3CC433C7;
        Thu, 19 Oct 2023 00:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697676895;
        bh=WvneTTviaBo2Z3d0DD7/4WAsvtBefdFeDwv0Riy4VRk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZfdgqxmDbHJUuH4iqY5ip8DOAIL77PxxpKJ0Rajq4nRxPPXIDUM20yclrohEslXgg
         +9goyj83nLEMAPsoQwJsNwXBRGRck/a1pqZwFN7/Ol2WVWD2rssU07xJHKV6qahaDL
         dMoWbX/VryXm8tEhqO2ldr4x79ff/W8MVjD8ms0nYwO8pLl3Ic3nFQf4sSe0NpzII8
         Dx9Gu548bIU9wnxJ1DFArfdl8JdCpDC20zAuQZv250WRPfYoWLe9SizAcFPUxT+6Ox
         eY861H28xAzsU9LI4wbumuXwFhRmljzbQTlm6HErNQinomDz21eUDFMnSTU8ocC8gM
         CWp8il8nY+w3g==
Message-ID: <5c4492d39cf42aba4285da41a574e733.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6d36eeec-6c8a-4f11-a579-aa3cd7c38749@moroto.mountain>
References: <6d36eeec-6c8a-4f11-a579-aa3cd7c38749@moroto.mountain>
Subject: Re: [PATCH] clk: ti: fix double free in of_ti_divider_clk_setup()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Tero Kristo <t-kristo@ti.com>
Date:   Wed, 18 Oct 2023 17:54:52 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Dan Carpenter (2023-10-02 00:04:36)
> The "div" pointer is freed in _register_divider() and again in
> of_ti_divider_clk_setup().  Delete the free in _register_divider()
>=20
> Fixes: fbbc18591585 ("clk: ti: divider: cleanup _register_divider and ti_=
clk_get_div_table")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Applied to clk-next
