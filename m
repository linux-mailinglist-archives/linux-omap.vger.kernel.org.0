Return-Path: <linux-omap+bounces-1434-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C358D6186
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2024 14:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44D6C1F25B46
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2024 12:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EAA1586C6;
	Fri, 31 May 2024 12:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdOL4nxM"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77059157476;
	Fri, 31 May 2024 12:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717157845; cv=none; b=lufdiumaUG8mj/E5TbjleRM+G3ZixXioYKKaT/BrfMH/OxAgYqeQ0I4VZiXNgLFnvn/n4YHf16MQOZN7DlLC4r6b06e8YRS0K/RGzIYEJtgaGsCDi4T62dhtrM/sB1ro45KltZCFZL4Lvntk/shSnP2ZjiPDgbpP7/nzgoyoetg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717157845; c=relaxed/simple;
	bh=3y/kTaOl0Tpo0SIWfZ+g2D1ziVkcIhbxO7TYtmrKXDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I6QpmuSf/EWEW7CP8tsgHlLak7C6hM9PSBAzm/xul1TsiSAZS4QUqyU9HhhtwV49qqTLH5NvQC4ngArqh9u1t6OffhOTMLaglGF40r03NP3BxzY9fFuFidXVgjtRxxvphk9z1mc+NTNEgBbxgLLoBV2fInk335knvbXLr/Mshz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdOL4nxM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B83AC116B1;
	Fri, 31 May 2024 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717157845;
	bh=3y/kTaOl0Tpo0SIWfZ+g2D1ziVkcIhbxO7TYtmrKXDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cdOL4nxMWY3nsAv7/WJ1YnydV/0nDJvR4ONdplNh6emfaANymXUvYOThN6Mew15SK
	 SXr+pNQ0rKMFLiTrh5LuCvyvFMcVspR6S/ToJ5c7DWgwk8eMmrqsFNKjTfRXTKhdYR
	 KdyDBtD6cy8vlyXiNGSigYQ19k9scBC+vlpQ3/IuvEqvRfyz9aoiv6FWG6zykX0lFn
	 bQcyf1u9ujW5XJd+0D81QuBcYsW0zJHT5akRCKLaYd78ok3E5UCsClf9kvIt12p+eI
	 XOnC7qZEzGbVaXO9pT+7xj8a570rU9I3X4IP7M04AeuWyrwvHFL0L2W8N2nrkB1nGg
	 lJeeWR2nUbraw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tony Lindgren <tony@atomide.com>
In-Reply-To: <20240508114321.964374-1-andriy.shevchenko@linux.intel.com>
References: <20240508114321.964374-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] mfd: omap-usb-host: Remove unused
 linux/gpio.h
Message-Id: <171715784332.1056361.10294064130920640362.b4-ty@kernel.org>
Date: Fri, 31 May 2024 13:17:23 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Wed, 08 May 2024 14:43:21 +0300, Andy Shevchenko wrote:
> linux/gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
> 
> 

Applied, thanks!

[1/1] mfd: omap-usb-host: Remove unused linux/gpio.h
      commit: 1b86176443dd808b1cbcf6729011484e55c42c7b

--
Lee Jones [李琼斯]


