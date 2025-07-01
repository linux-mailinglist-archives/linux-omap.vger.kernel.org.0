Return-Path: <linux-omap+bounces-4003-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0B1AEFAB8
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 15:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34F451890386
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 13:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388D427586C;
	Tue,  1 Jul 2025 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abqn2cPn"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C237025F7BF;
	Tue,  1 Jul 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376573; cv=none; b=FQdyESckLULBHWkeWUOzQ1WIsxpu84XKRTFIdFUuJ+e2nVenOzZewZzvDJhmA1DdYUGBDK9cv9rT97LMzIbv6BsUigQRKyWQx8OO06npOH8cTWxhCgIL4cgJON8C0EzFMH1paj9zL0lB2oxQTz05amXDZrR4f3X7XCgVM7tgQ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376573; c=relaxed/simple;
	bh=3LIg6yceOqFUQw7kikoxU3ZQIbITeywJExccMUXQDWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pRD4Yis7NvTjbOjcXyLOhivoVXpGUT2KC+yqbl2a49+aftvp8VzzhacTYkGyrY1GYl0jVNKPpEUufKVFthbx2ySXRL0F19B93amtJydr9poND6Oo5E6DC01E0zgsPJlTqqP+aBVY/RBiJFiY7cnoGnsnV0LD+N0YYcawDtOO/Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abqn2cPn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DA0C4CEEB;
	Tue,  1 Jul 2025 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751376573;
	bh=3LIg6yceOqFUQw7kikoxU3ZQIbITeywJExccMUXQDWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=abqn2cPn5LOFwhOLdknTO6cT72uXoup981H4qRBJ72cF8y84t9P7rmWRBggLKwY6p
	 DN5t/LPdUfaZiqR2fdlcnNTmpMPT7I/joefZdZml3Uph9wzOpHH4FUwmtJF2RvQwSp
	 GJilkOzu53CYWosWfrAdGtABBSmELHNPpbLeFtKMBemVgSqXTUsL5R1GBkmz68xlUN
	 Gy1plzmAsjTHvThqeMrvjAk4fMqiTLgLkQMGRQXrLC5bzJCYsp+j5BNahP9qdUuXc1
	 tEQOQ1sdcK1MS7oo+NInfW8KM7eVEFjSzg+fFx2xZINqHYd4Bab3bqf9vP/lgBnmQw
	 S1A6shUpspVwQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Geliang Tang <geliang@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Geliang Tang <geliang@kernel.org>
In-Reply-To: <a2cc3ac9466633ea44a656a855ed80289ae917e0.1750905716.git.tanggeliang@kylinos.cn>
References: <a2cc3ac9466633ea44a656a855ed80289ae917e0.1750905716.git.tanggeliang@kylinos.cn>
Subject: Re: (subset) [RESEND PATCH mfd-next v2] mfd: Drop unused variables
 'node'
Message-Id: <175137657148.2321363.112208113279845572.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 14:29:31 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Thu, 26 Jun 2025 10:48:07 +0800, Geliang Tang wrote:
> This patch drops the unused variables 'node' to fix the following build
> warnings:
> 
> drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
> drivers/mfd/88pm860x-core.c:576:29: warning: unused variable 'node' [-Wunused-variable]
>   576 |         struct device_node *node = i2c->dev.of_node;
>       |                             ^~~~
> 
> [...]

Applied, thanks!

[1/1] mfd: Drop unused variables 'node'
      commit: 0e76098aa66eb82189f5a0681717862271bfb805

--
Lee Jones [李琼斯]


