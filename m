Return-Path: <linux-omap+bounces-2971-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7476A013E1
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 11:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0115A1883FCB
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 10:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B42A176242;
	Sat,  4 Jan 2025 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rYeCA75V"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EC7185B62;
	Sat,  4 Jan 2025 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735985701; cv=none; b=JQLQNfJWQgDcFjKSzOntG6dX3dPAbIaxC82MtDTagtp7nUHokaH0dPi5mkrdjX4PgYCiSnXZEDy0TyQB12QeGJP1AqMgPi/TuJv6cxb6EtE6TWDSk3JzgwfUxTNr8M07S7sXE8qtWYEVcVx+L0MtbHBGKF65stpJXVgorz1ggbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735985701; c=relaxed/simple;
	bh=VJSfvgFZ+78VmxD+MOIgIsz+3FZN6F5TgCICTOVmBi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDQIvIV1K6zTmVIhh9F5qmZgTkwes08XQmU6sdJOHBLpL9oONKWcBAtOFHYrwLHBR4ZRm7tmrdSzNRRGOeSWEV6IltSsCPmgCmrKFeMFbRiXLdlTs3T3z+opKc41i5zsS0H+Suewqi3TZ8AnHr5KAJcMvnuRHosVohfE6yfniWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rYeCA75V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E240C4CED1;
	Sat,  4 Jan 2025 10:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735985701;
	bh=VJSfvgFZ+78VmxD+MOIgIsz+3FZN6F5TgCICTOVmBi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYeCA75ViPFUIM7AfKSJYRuXfrpa1n3ezGNsu8j3DpUvVzwC2ivSTLeD68RcRjJk+
	 ID5ssMHtFBL4iW8VRstzDCla5SJP+f9D/toczroICatgp3LPKocHrQybpzVBLFd6Ht
	 w28nXJNuYQm85ngCtpWfLeAd2QIgHGpWUxnBqFpECeyqnx+bHaYc3f8P+T/xLzoocH
	 757lnGqDrp3etv8zJOPoECzJPlKE5cSOszBQ+gtbOSzALXaLZQ3Bo5iUgMOZUlm6H3
	 4fFyz9tw8pS/MN7UGjgwxHj+VeTQ7Om5WPfkZnNTH5R3v/4ZtGXb6m6J8m9X5l3FDn
	 1i1JgMP4C+tlQ==
Date: Sat, 4 Jan 2025 11:14:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info, 
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, jerome.neanne@baylibre.com, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	m-leonard@ti.com, praneeth@ti.com, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v2 5/7] regulator: tps65215: Update platform_device_id
 table
Message-ID: <rnqlswgkn2gl4yprxu4h4a3fp3ajelf2ksinjjq72f73bqzxsl@icxg7v5ujzbs>
References: <20250103230446.197597-1-s-ramamoorthy@ti.com>
 <20250103230446.197597-6-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250103230446.197597-6-s-ramamoorthy@ti.com>

On Fri, Jan 03, 2025 at 05:04:44PM -0600, Shree Ramamoorthy wrote:
> Add TI TPS65215 PMIC to the existing platform_device_id struct, so the
> regulator probe() can match which PMIC chip_data information.

Why is this a separate commit? Adding new device support is one commit -
so the tables, regulator definition and the quirks/ID table.

The next commit will be adding new entry to of_device_id?

Best regards,
Krzysztof


