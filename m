Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D3B1D3DFF
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 21:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgENTy4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 15:54:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:47436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727777AbgENTy4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 15:54:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 091882065D;
        Thu, 14 May 2020 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589486096;
        bh=sHckjXBqp4/iLQ424vUBaKOto/lpU2hIE5N4zfZT/rE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O99igFR/oGl1E1hjyNA7kOuvPLe4RcUz7k0vygONS800GULdgpgZJR8H/PAttTY4W
         Vx1imcZ2ssK9+4iSx8CzziMLb4WnnRjOB94O6pcJUkaqbbD7/QgD4PjQzPyto3c/o6
         n6iOFruMqLnECmw+s13Tt9NvajWSeVybHDjj6hS0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200429131341.4697-2-t-kristo@ti.com>
References: <20200429131341.4697-1-t-kristo@ti.com> <20200429131341.4697-2-t-kristo@ti.com>
Subject: Re: [PATCH 1/3] clk: ti: composite: fix memory leak
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Thu, 14 May 2020 12:54:55 -0700
Message-ID: <158948609523.215346.10638457106027726812@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-04-29 06:13:39)
> The parent_names is never released for a component clock definition,
> causing some memory leak. Fix by releasing it once it is no longer
> needed.
>=20
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
