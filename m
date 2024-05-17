Return-Path: <linux-omap+bounces-1390-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B78D8C8D57
	for <lists+linux-omap@lfdr.de>; Fri, 17 May 2024 22:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363C3286891
	for <lists+linux-omap@lfdr.de>; Fri, 17 May 2024 20:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767151411CE;
	Fri, 17 May 2024 20:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEnd9VM3"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8FEF4EE;
	Fri, 17 May 2024 20:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715978310; cv=none; b=QNoOLEUw5IzRTF0hbWToEyWHxuMHmuWZklSFRShv0y5Fm15z1bHnWN8XG8frOUP0ky+2ZdOY4eqt+h8smxZRNwP6Ptlggfad9hUqCapQ6HVr31M0upJw71jQ4l4fTwIEKZCDTHjxfAsF+vFQ361qmlcT3fJAThVUM+XC313LZI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715978310; c=relaxed/simple;
	bh=qZxGEu1hAOMmpvEJRGTMEizv4knrf8goXPzI+KOUMZ4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QC5jTYi4VLowJ6hH2fkXlP6oYt/Bbg/98jKimmOwCl9D5sDrNB4KpKKXbdF+jyTrS+78urnV6c+RPRi2pPXZ2gmoco6UX0pk2+pbGGwtjaz4eu7Uxb38dbvdK8nmCEmx33HBHDQRKFIOrlyrf0kXih9lTa2uR12bfwaAQ7UFPWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEnd9VM3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EC14C32786;
	Fri, 17 May 2024 20:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715978309;
	bh=qZxGEu1hAOMmpvEJRGTMEizv4knrf8goXPzI+KOUMZ4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bEnd9VM3U/qZtWjrIsDwmUE0L42Qh55OPmYP4nL1IvXRjySNl+FqTith8kqdcZR3g
	 oBPjZe9ASSV0CvMUAYJ1gs0q2ERuNDG+/UPQDSvafulJ8ln5u4VtY9D1namgHUA0gk
	 J74WDJ1AG6zoOTjZ4L2gTLPx6MUskfOcIcbppRH9+1tQJtA4FS7Uy8/i4hyIwsa9rH
	 pvs+V8oEgIXwpDYD6b73OQsKhIcyclreBz1iOi9hhh97olqfMvdVAGWtodQINhEIiC
	 SdRBjS3GTPpOWHjnIid1Yw2m+7VEYx3DoPMKQJtKA3cBY4CBFNOUve3Zyrp0DGnVyI
	 cHCwH81nnLZew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C09FC43336;
	Fri, 17 May 2024 20:38:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: net: Update reviewers for TI's Ethernet drivers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171597830956.5541.6328372782096647166.git-patchwork-notify@kernel.org>
Date: Fri, 17 May 2024 20:38:29 +0000
References: <20240516082545.6412-1-r-gunasekaran@ti.com>
In-Reply-To: <20240516082545.6412-1-r-gunasekaran@ti.com>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, s-vadapalli@ti.com, rogerq@kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 16 May 2024 13:55:45 +0530 you wrote:
> Remove myself as reviewer for TI's ethernet drivers
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: net: Update reviewers for TI's Ethernet drivers
    https://git.kernel.org/netdev/net/c/31279b0cb45f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



