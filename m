Return-Path: <linux-omap+bounces-2452-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3F19A2D3C
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 21:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11CED1F27D3D
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 19:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7094621D2B2;
	Thu, 17 Oct 2024 19:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpG2K/bn"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6781E0DC3;
	Thu, 17 Oct 2024 19:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729191956; cv=none; b=qYNBU/8CdFfaOTTafEoEVKhmzpUdC2rk+bopJVDEPHDs4WFs7fZrKlRbOJT7ieM9o6EdqCdaFZzoDm2e22qhjBD3JKCjSngNuoXyMv37utxa6J12Wi04k8EqPZKRWjOAxjExEfMHCpou8kGFuuo0rRIPiS5ugmxH7905gASi3ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729191956; c=relaxed/simple;
	bh=K1n/xGjmay0WFI6j5y3zJwo6JUjOFfH8Beo8ZHEk8jg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=at9x+4i6xJXVVrKRuVcBS9VROly2ULmpM/mMcLS+Qvhx29DIU5QKBgxEvxT//cB35JSvFnh7k/RMiA0lD3n2kLDMEl2/zawWdVvsmxLQUBjMFQvmxh4Q35bLskEgiZWyAv1AE90gxDYapxQL8K7zfC52NzJSHbCTap0TS4uY/o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpG2K/bn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C845EC4CEC3;
	Thu, 17 Oct 2024 19:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729191955;
	bh=K1n/xGjmay0WFI6j5y3zJwo6JUjOFfH8Beo8ZHEk8jg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GpG2K/bnC43P19iTvgBNLJPQ1gj1af9fI73Bm/LhplC/puH9/aHTuqMLOeY1Ujish
	 IAMNvbv2DHE0m3imtfTClbkVRvUEyE9/7F7HA/M7kMsKFI0umqPF+UAPyuQypIQS47
	 EfXbQwAvaadXVN6I9T1GSEX5lw/AbzsZly+LTYPn1l2P7LR/X75sFH+C7o3ESVDsgX
	 C4xuyT11CeJz+BxfRsmESaKNMThZ2j+RBycBIhYpa3KUd2O/VtsUtJmdeHILoPmlK3
	 gSHze6FSBu8+7Rg1u+heimkZkzy5DiFV8BMm9MIVJns4vX1sPXgkQ9iyXxUvBSqB5e
	 G5tAjnfqHlCng==
Message-ID: <81659ef1b2f5ffd95e6c4288a6861b1e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241014161109.2222-4-andreas@kemnade.info>
References: <20241014161109.2222-1-andreas@kemnade.info> <20241014161109.2222-4-andreas@kemnade.info>
Subject: Re: [PATCH v5 3/3] clk: twl: add TWL6030 support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Date: Thu, 17 Oct 2024 12:05:53 -0700
User-Agent: alot/0.10

Quoting Andreas Kemnade (2024-10-14 09:11:09)
> The TWL6030 has similar clocks, so add support for it. Take care of the
> resource grouping handling needed.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---

Applied to clk-next

