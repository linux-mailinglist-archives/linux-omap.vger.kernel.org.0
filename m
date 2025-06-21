Return-Path: <linux-omap+bounces-3951-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E9AE2CA9
	for <lists+linux-omap@lfdr.de>; Sat, 21 Jun 2025 23:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84744178567
	for <lists+linux-omap@lfdr.de>; Sat, 21 Jun 2025 21:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A333C2741B1;
	Sat, 21 Jun 2025 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQD7/0pP"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD27273D94;
	Sat, 21 Jun 2025 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750540827; cv=none; b=EvQYBOhBatxusIgnPmWYuEsMA66vpdltoZj8KvO+6qXNamng9b5m83G87e2g9LMHJtPAcnV1sQVHqC/SMvnbtzXAw9RzBsQXDZfNViOL1DcYdFUsM40nGFFjEKxaOPZyr/GgKXj8RAz5Uxl6UCYp4m9ycwKUD/2mxsNRC77ff3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750540827; c=relaxed/simple;
	bh=KF0v8DCtq17RlZLWUxven1kRuFoc7e7luqK4sFEydAA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OP658G4M8h2YiCH3lIneN7VI8RkinBz3tG8xiMwZxn2WvHMRS+v21ms3/Zd+xIHM5U0FzTJEs468+y0Ddc2mcoy2aZqJLXi+WsPvaEO/ZgE8RtIQKeL/pIQjZAURu1HB14IxAwL0eP6rSJdguNkdkv7D18wemQsnKuXb4kjXtVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQD7/0pP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01A8C4CEE7;
	Sat, 21 Jun 2025 21:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750540826;
	bh=KF0v8DCtq17RlZLWUxven1kRuFoc7e7luqK4sFEydAA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JQD7/0pPVzVYfs8s7Szg5+5TdQMHlcwwLTmRkUGk/Sbo6RNWRCqXO2dL16z95XOzM
	 polrmpALcVgu2RuMp4ZZm+pQuL8uR6EX6alQQIJeR4L3ILiQ3/9SpH1MoSGnd05J6l
	 9io8Rwsy1EW3YzAZe+JngNJZO56SygHQdzorrs1STaoJ73htmmPWILxbY+qQWENubl
	 LMYRZl+hAX9xOmUJJa1G3fJm4Pid+9xczH/2ahp2HcYMFFhNGPyGETS805v1cPTcV/
	 w2a/7S3mrFSWKye1yqT7l4PYA64XbjBAfPOVNzQY0zXPSappMBOC/WPEjgGzkB7Q7Z
	 rPGB+R7YOwzww==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250312163330.865573-2-robh@kernel.org>
References: <20250312163330.865573-2-robh@kernel.org>
Subject: Re: [PATCH] clk: ti: Simplify ti_find_clock_provider()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>, Tero Kristo <kristo@kernel.org>
Date: Sat, 21 Jun 2025 14:20:26 -0700
Message-ID: <175054082614.4372.10566518984855625833@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-03-12 09:33:30)
> Remove using for_each_of_allnodes_from() which is not safe to use
> without holding the DT spinlock. In reality that probably doesn't
> matter here. This is the only user in the whole tree, so it can be
> made private once removed here. The "from" argument is always NULL, so
> it can be dropped as well.
>=20
> There's a slight change in behavior in matching the "clock-output-names"
> value as the prior code would match if the node name matched the
> beginning of the value and the comparision was case insensitive. Now
> it must be an exact match.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

