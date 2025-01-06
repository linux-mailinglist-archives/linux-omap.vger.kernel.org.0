Return-Path: <linux-omap+bounces-3011-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA555A03386
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 00:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61A0518857BA
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 23:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC87B1E32D5;
	Mon,  6 Jan 2025 23:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1f3sK5n"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB471E2317;
	Mon,  6 Jan 2025 23:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736207358; cv=none; b=PfAT5EC7qV0yPG5tPOJK43NLEfHFalnsTNmoX3MaZTkTl3VL4GKKkALnOzpjBuvnCy+NrwPTiQ95vP6ZcRm0WuDG8xKROgmW5O4vioLrRZDwD4qwiXU+ewu4GNdmRcKpb5mZA5uC9KcZzIxY+TKCgtT4hWCQWYFz5i02ZGEIkuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736207358; c=relaxed/simple;
	bh=AKDblFyGSXFHnQiBgrRD0Gxn72X5JIg7RBip/sLYtvk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=UV1nsZHMgnbHz3NisOIsXIu5jRcYarAUXYKAkQHFjptONnAVOshAx6aTQcAp1KSzObAn8TMffy69FvD9Hy7beZ1gTnu2uLz7J65MQ7s0atWHbZSRVqI17L/iTJKgrOCNX7NbqWt//YkZvpaJux72MBK5wjZ2C/vxYI7ACaa7p68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1f3sK5n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CECC4CED2;
	Mon,  6 Jan 2025 23:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736207358;
	bh=AKDblFyGSXFHnQiBgrRD0Gxn72X5JIg7RBip/sLYtvk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K1f3sK5nKW1Evn2VbiakpExEBZdVGYklt02ihKSbRUOYdxm6K+yCTotn3WVum1xfN
	 Z+VVE4nQjD/H1BPkZ8uvq0IZ9uz1tTHhiKkQRaJ9Qg7jzbubeItrY2pEN+LtJzIFEM
	 rl24Ec9F0pYpU+v+nlFXchIGlyNuOg4mxaoGdJNDOgJIfVgNcTNST48TmCAkj1zxj/
	 6qP/WrbdViepMm1TNG4Cm3vCy/37B8uahTUX9TcHEU0xHnrz3gUdgaD+Jo7BXkRClH
	 Ou3e0s7cMM3MEgqRbLwDZmTROfycfVI3H9g6G4twXN8kIU6eLw81RIOYfmQ8zf/1lj
	 a+/A8n5s+5WUg==
Message-ID: <5cfc565e175bdc5b37dc875bf8ee3076.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <xfjn4wqrhukvi45dkgkbulamq3242eijn7567vxwaxznh4ebdr@waat7u3l2mhi>
References: <xfjn4wqrhukvi45dkgkbulamq3242eijn7567vxwaxznh4ebdr@waat7u3l2mhi>
Subject: Re: [PATCH] clk: ti: use kcalloc() instead of kzalloc()
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, kernel-hardening@lists.openwall.com
To: Ethan Carter Edwards <ethan@ethancedwards.com>, kristo@kernel.org
Date: Mon, 06 Jan 2025 15:49:15 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Ethan Carter Edwards (2024-12-29 21:28:58)
> Use 2-factor multiplication argument form kcalloc() instead
> of kzalloc().
>=20
> Link: https://github.com/KSPP/linux/issues/162
>=20
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---

Applied to clk-next

