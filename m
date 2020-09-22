Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F05172749B8
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 22:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgIVUAn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 16:00:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVUAn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Sep 2020 16:00:43 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 180CD20715;
        Tue, 22 Sep 2020 20:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600804843;
        bh=VhS/TRefYKw6GN+wQDAFW0oV/d7n6r8BMYeyrgSJXK0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tDhRFh/pzfluhMue8q3VhQnQwbteqean6Z2kzZpKY5qlVFbeLUn8q1oHnqh/YW/Bw
         8n4rDDsSdfu83ifKWHde1GOZRCJ4fSTxQcMpwfQ3zZuHKwsFRLm1St5m+C+3otImq3
         bdZZWz5TImvo3U8fgso4dY4GG7GV1nxL3Njghw9Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200907082600.454-4-t-kristo@ti.com>
References: <20200907082600.454-1-t-kristo@ti.com> <20200907082600.454-4-t-kristo@ti.com>
Subject: Re: [PATCH 3/3] clk: ti: dra7: add missing clkctrl register for SHA2 instance
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Date:   Tue, 22 Sep 2020 13:00:41 -0700
Message-ID: <160080484170.310579.14951972976549025978@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-09-07 01:26:00)
> DRA7 SoC has two SHA instances. Add the clkctrl entry for the second
> one.
>=20
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
