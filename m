Return-Path: <linux-omap+bounces-2927-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 776359FEBDA
	for <lists+linux-omap@lfdr.de>; Tue, 31 Dec 2024 01:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6808C18830BC
	for <lists+linux-omap@lfdr.de>; Tue, 31 Dec 2024 00:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF9C524C;
	Tue, 31 Dec 2024 00:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qygM0ByG"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C9E64A;
	Tue, 31 Dec 2024 00:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735604820; cv=none; b=KQOeQb9XXOxmD/ltVdtij3isd+BjGTqqwkpf+btsMgBnMg5zIFh+vAFuWDuzgJkHhoek0JEeNUX6xYdn2liZSCtlzkAvwdQQRGbqE2pNhV90wfkFPZNSGJyALJfnQevrVFEXLGqTKr/+UWQWsxVJPRaktajuZwjVspOjitFdtJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735604820; c=relaxed/simple;
	bh=mVqcKmLLfuhSGS3gshPLQdbKu6p2tqxAbOx6us0UBEg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:To:Date; b=fEIDtFEmufj+D+9OS0bRSmL7wZLH7FsYvxnSChJeIhu4lCq6FAP1hjLVYsrf2EMjO1/715VsmODFz0biY3Al+dL97MOUy8OQx2eiWyohHW3Ep0PgoAjjcsOlNTTtlvmeADZfukLwd4Svf5LzaFlQuRKotxOFhG40w9tibayxooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qygM0ByG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94977C4CED0;
	Tue, 31 Dec 2024 00:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735604819;
	bh=mVqcKmLLfuhSGS3gshPLQdbKu6p2tqxAbOx6us0UBEg=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=qygM0ByG4CVsbJJyDrg7s9qDcCvr15UnD7ar5nPo3j3+xq/vJHt3/iX12IlAPTcrH
	 rM7RsDNh/uPtGCnnTFZf3Oi4fBOrXHcbore5++0wbeqhMxhPvsX/CaNGeLlzAbl560
	 n3b8abaGwdM4n6AWL+oAgUKmFWhPimU550Ix+fMinRiTpdCzkUaCJIf+NvAReSmYjp
	 dl/ppki552FIo/cBptccQI978B0Iqw7gfW72IGWnSxtApljmKSCGWhlk/uVJNLJD2d
	 l0OAR09acKZVaNT2givjksfEv1UVUG8KFifMI1xUomJIQkdyoer5lOpmZ+FR6dpv5w
	 DtnELtUBEjS6g==
Message-ID: <bd1f8992ac2cc60b3192ea93402ed186.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241229135351.5014-2-akemnade@kernel.org>
References: <20241229135351.5014-1-akemnade@kernel.org> <20241229135351.5014-2-akemnade@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: ti: Convert gate.txt to json-schema
From: Stephen Boyd <sboyd@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>, Tony Lindgren <tony@atomide.com>, akemnade@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Date: Mon, 30 Dec 2024 16:26:57 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting akemnade@kernel.org (2024-12-29 05:53:50)
> From: Andreas Kemnade <andreas@kemnade.info>
>=20
> Convert the OMAP gate clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> Choose GPL-only license because original binding was also GPL.
> Clean up the examples during conversion to meet modern standards and
> remove examples with no additional value.
> Due to usage in code and existing devicetree binding, add the
> ti,set-rate-parent property.

Can we somehow mark these bindings as "undesirable"? We don't want new
bindings to be written that use one node per clock. At the least we
should put that into the description.

