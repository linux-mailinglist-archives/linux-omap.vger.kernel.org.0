Return-Path: <linux-omap+bounces-2461-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3FC9A4B63
	for <lists+linux-omap@lfdr.de>; Sat, 19 Oct 2024 07:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37A72B2266A
	for <lists+linux-omap@lfdr.de>; Sat, 19 Oct 2024 05:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058651D7E52;
	Sat, 19 Oct 2024 05:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPLyJG5P"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745791D5AC6;
	Sat, 19 Oct 2024 05:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729316787; cv=none; b=HDRGuSibVyAZrdo5xchwmqsbWmoGccWz3Vz3/pd2JH1jy3DEAB5vXI9nPlrLSzp9zuevWoG33Ntr5+wDlprVUbW0OBQ1RthJOxFAenEBsX5wmOj50/KX6s/3LW7J8dT3L6VQVsBhrcWxslK0zIBQGu22gsUlpun1TLkYQUvF+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729316787; c=relaxed/simple;
	bh=EgetYIpgfpK7YmRAwBVwIZeFmcKxRnjFAEuWjcwEPQg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:To:Date; b=ADH4tenBjuXxlswOZ6BEIJ1WPqhpk4Jq9QQe1dneqMTMwjJU3eAf5/1+QhXaUlXH4fEkKA1FZi0VzxjT0Lp//C36ehhbB470moP0fneLae5bz+h5n2wIG+gaLebJaLHKUn+SrP4J44QTJ9jkdOxDYjkF8DgkA9zZXjJuc3erfbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPLyJG5P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30574C4CEC7;
	Sat, 19 Oct 2024 05:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729316787;
	bh=EgetYIpgfpK7YmRAwBVwIZeFmcKxRnjFAEuWjcwEPQg=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=EPLyJG5Pkqmh5kDVxWuVhB1PSN6ynt2RjM5rnRdkHyzQz1w7r4vj9k2BAEETOVzrW
	 RZRYqTxKehYfKmvoe9rUVn5HMWzswufMrbaJh3NXzzxVgRL46EkXY4U9r5D8IwBFhT
	 JK4LibAtSO24nT6nKfIayXC+UuuSwNtuhVCusXAaIL8bCopKbIiUN3WL1XcAuYa/DE
	 aMgsqA3VL8Ve1GWzygukXScRs98/UPEaQDuQv8+RBbi+xqejNVj3qUoKDRmP68aETD
	 ktefJ4roGjY2s5T1PkvxuPG2OdWAvlbG0Qkh7yqlkS9BvPoiWCN9ah8ebGnlwOYZWl
	 DP8DL8tBTi9aw==
Message-ID: <e06c8991a365766a325cabe3ce2bcdc5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241018085347.95071-3-andreas@kemnade.info>
References: <20241018085347.95071-1-andreas@kemnade.info> <20241018085347.95071-3-andreas@kemnade.info>
Subject: Re: [PATCH v3 2/2] dt-bindings: clock: ti: Convert divider.txt to json-schema
From: Stephen Boyd <sboyd@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Date: Fri, 18 Oct 2024 22:46:25 -0700
User-Agent: alot/0.10

Quoting Andreas Kemnade (2024-10-18 01:53:47)
> Convert the OMAP divider clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---

Applied to clk-next

