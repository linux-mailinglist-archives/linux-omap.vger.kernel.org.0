Return-Path: <linux-omap+bounces-729-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B678673FE
	for <lists+linux-omap@lfdr.de>; Mon, 26 Feb 2024 12:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EAE61C241D7
	for <lists+linux-omap@lfdr.de>; Mon, 26 Feb 2024 11:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476B85A7B1;
	Mon, 26 Feb 2024 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="g2F/HLcO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917C95A7A9;
	Mon, 26 Feb 2024 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708948631; cv=none; b=esSje02Rlq19SlenpcFQ4L1kiq3dLJcGe7GNtxUeD2r+JIq0knqQBW5C5Bccb6w5d6PfszdgM5sBzU2KhHPPBAJ1G8GlKlthY2RbDQi+f4Racz7xzHQkNbUIMLNLE3KFXnUtG5+rdyjqijxlEx1lLP/I00/epWAFEaw8zMPGY4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708948631; c=relaxed/simple;
	bh=CuN6hcX4+pxZHpy3+HgQ0d6Qc9hrsnZLHwlTegKECkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqKVqEtWZHZw5PxCEvbHsnuipafDffAsgYImBOofaXmjHge+Ft0zOFi4cDgJ31jL/yQQdRCVVy/YsflG+ypPP0x+P4pCojJFxaaLNo95UVM17lhO0h3D/uQozQCFbgHyRrpYxjIRFgD9Oo3orTcMf6tVwUMRrIfQc6QH1VJZ7aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=g2F/HLcO; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id ACE2F6058A;
	Mon, 26 Feb 2024 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1708948629;
	bh=CuN6hcX4+pxZHpy3+HgQ0d6Qc9hrsnZLHwlTegKECkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g2F/HLcOdGUWa4TvPSz4w1Ci8v0FLZP/X3gcibv9PxPRtfpZAh5MrHTRY2pZ2NjmV
	 BPsfoThTS3GvQnbe8a8NvfMxQzaBsMHAd7hWk6Trs7YdCYdRti4OVOCJCvACV5hRbk
	 QlAmg3A6eK4+3ZPa8W3CudO6ri1R3+6H/sorLnB+QEx3kkhADE5vmiifSxFvhq508R
	 RSjgDEEMcUMALNTPyPeo9d2168KD8xSQiEi6nQz+UqmxKGA0dGFdfwD6vNyW6LUfnv
	 c+h0QsFaxnRmQMvrR6JNrJEBDGRGqzHIx0ssxMpQ7TVfUsAN6i2bHsWbOQdwIDNN24
	 a9rof/z8/7TUg==
Date: Mon, 26 Feb 2024 13:56:50 +0200
From: Tony Lindgren <tony@atomide.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Romain Naour <romain.naour@skf.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: ti: omap: add missing phy_gmii_sel unit
 address for dra7 SoC
Message-ID: <20240226115650.GY52537@atomide.com>
References: <20240123085551.733155-1-romain.naour@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123085551.733155-1-romain.naour@smile.fr>

* Romain Naour <romain.naour@smile.fr> [240123 10:56]:
> From: Romain Naour <romain.naour@skf.com>
> 
> phy_gmii_sel node have 'reg' so it must have unit address to fix dtc
> W=1 warnings:

Adding all three into omap-for-v6.9/dt thanks.

Tony

