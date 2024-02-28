Return-Path: <linux-omap+bounces-758-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AB386A90A
	for <lists+linux-omap@lfdr.de>; Wed, 28 Feb 2024 08:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92CC228A01D
	for <lists+linux-omap@lfdr.de>; Wed, 28 Feb 2024 07:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AE825615;
	Wed, 28 Feb 2024 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="IigJaF1A"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A87925602
	for <linux-omap@vger.kernel.org>; Wed, 28 Feb 2024 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709105698; cv=none; b=PNBgE33bp7hK3VSWC42KfR9rgiooymbrhDIBWvb3d6GYT1aQc5VBscAv0H3oO4tlbwsR8rtGf44KqjV875HXNb9t0LTdwp5q0AYpa7ysf7NMsY2RNGcbKADIxb/aAmOV+jfaRu5mOj/UpRn8aWREoxdZJQtrIekGemiJvio+LuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709105698; c=relaxed/simple;
	bh=UpwhFsdu8Q2tubpgsFpZfo+qYMSyVRD1qI0bWQeGVow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHJ/qOgGZ4f6B4TKSLiAt2/dITsJ0I/UU6bZpQAU0sXv7NVLQ/rnRgw8n12R3IX0+CIPsBaIOrn4Do1dIWu92j6wE0AK8Zg+wv4q61K2flZ/u9RioucsjM25iXL1AnZjK0ubqeh8CyU/O4sAMoCg1yMeE/CrIftHLqeONIJwUN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=IigJaF1A; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 387D7604A0;
	Wed, 28 Feb 2024 07:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709105695;
	bh=UpwhFsdu8Q2tubpgsFpZfo+qYMSyVRD1qI0bWQeGVow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IigJaF1A8/1xobIgF89++ut6BB6nOQDtq0Ccq+BKhamccOM9+uWnDXv+o7DbJIaOM
	 NNS1/RYO5uavp33kKStk2t0dFqGqpEQWDwiAh4DGv5VjouSG9tbd+4Bghgr3QRPTt6
	 RaFqN9wLCyfUi9bQJ8FIPW1k8gknC6zm4fs/02nDtVZBKrRg/nn/yRIQVYH/8RCAQZ
	 LhG+4R85666iFcaTVrJkURJwh3UYEDFWdZWpo4qq84+0AkENghi6rudjcvpogFBOoA
	 9kckniN+s8UlXa6NkqWIAQIcWF9vZmH/QQO8tJXhn/LPs/8ayy9u26PbhRmC7V8Jfk
	 rCCNFeHmy0MwQ==
Date: Wed, 28 Feb 2024 09:34:43 +0200
From: Tony Lindgren <tony@atomide.com>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-omap@vger.kernel.org, Paul Walmsley <paul@pwsan.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ARM: AM33xx: PRM: Remove redundand defines
Message-ID: <20240228073443.GF52537@atomide.com>
References: <20240221154614.3549951-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221154614.3549951-1-alexander.sverdlin@siemens.com>

* A. Sverdlin <alexander.sverdlin@siemens.com> [240221 17:46]:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> AM33XX_PRM_RSTCTRL_OFFSET is already defined in prm33xx.h and
> AM33XX_RST_GLOBAL_WARM_SW_MASK in prm-regbits-33xx.h.

Thanks applying both into omap-for-v6.9/soc.

Tony

