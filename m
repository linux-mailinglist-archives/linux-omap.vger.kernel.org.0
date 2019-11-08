Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25260F520E
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 18:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731028AbfKHRCC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 12:02:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:45928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbfKHRBz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 8 Nov 2019 12:01:55 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B830E222C4;
        Fri,  8 Nov 2019 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573232514;
        bh=XUv432m0Znz8Tr0WKMLOSWDGM5ojIEJrYckBBJUmOCc=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=ZC/uj8XMuX0P88rPmFq5P0z0qVqoHGgrw+HnS81WAVaD0ui6qyeu79eOUuCSDVNf+
         u9Qmjy/sEanGQ+pn0A6sYeHCLm+2lY8hodVluZK5aLY2vUVMezwYvIfwwtYDR1EHCZ
         KlR32ri4/fXghBUcO8WHmVZXpg7MAOPtnAsx7ADk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191019140634.15596-1-steve@sk2.org>
References: <20191019155441.2b1b349f@heffalump.sk2.org> <20191019140634.15596-1-steve@sk2.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH v3] clk/ti/adpll: allocate room for terminating null
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 09:01:54 -0800
Message-Id: <20191108170154.B830E222C4@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Stephen Kitt (2019-10-19 07:06:34)
> The buffer allocated in ti_adpll_clk_get_name doesn't account for the
> terminating null. This patch switches to devm_kasprintf to avoid
> overflowing.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---

Applied to clk-next

