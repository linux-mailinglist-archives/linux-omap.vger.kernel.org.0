Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6FD5F51D8
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 18:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbfKHRA1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 12:00:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:45002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbfKHRA1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 8 Nov 2019 12:00:27 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55DA52178F;
        Fri,  8 Nov 2019 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573232426;
        bh=Cn0SmJXbgc0O8vZqS7fq3T6tHgeTq6RIfCuQnwEt5/A=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=opcnFkYy/TUicFZuuXCRLbIev+ccxBEJ9FoPspQa0NOUSwFnhxT5ukL1or43P21L5
         lFBjXqUg+xRn8Z8nXgEeclIfBAv5yc6qdCzRnJcCtF9Uzg2SUyHhvoxbM1OtyTjitV
         /aAvThDttcesn5UxQUvjmGiriHcsShHIReKlx8nk=
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
Date:   Fri, 08 Nov 2019 09:00:25 -0800
Message-Id: <20191108170026.55DA52178F@mail.kernel.org>
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

Please don't send as replies to existing threads. It screws up my
tooling and makes it more manual to apply the patch. I guess I'll have
to go fix my scripts to ignore certain emails.

