Return-Path: <linux-omap+bounces-3240-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BADA9A22EC2
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2025 15:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B181F165970
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2025 14:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184471E9B2A;
	Thu, 30 Jan 2025 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjr7SdDB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954711E7C2E;
	Thu, 30 Jan 2025 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738246218; cv=none; b=ozuNlG9eDEQJdSvROIiXCcr4JwRqpMuvywHdfFXuubDOYYlFPGmcOausZcDrS9EjKzubAmCf9D7R6QlgyC9dyUuCf8fKyMkIRXmGXFgOvAWfo/o4S7A1E2xUyqYtp93tslRe26QK22/t2n8yEZd5jiHUe0qjS0jxlPamHh010jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738246218; c=relaxed/simple;
	bh=9+g/CdbDGQY0MKh8KuXIORy84Cune0MY5qj0W7Kj2Qs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XjiKgm92iaULHc1gCyXztLJSqtnVnyL8rGEd4mkH3PfdDOF9g4hYUMPFNdS1l//EMBZx53tyyisHGc8g1t9TkvQZfHJOr3OA30Hx7FVrxqhPfdheb0SQTi/6NniGGDbxfQkL5BP3NIVaWFDBNA9ZQgHqw4xwxu56LcZvfuCXlUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjr7SdDB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078F6C4CEE0;
	Thu, 30 Jan 2025 14:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738246218;
	bh=9+g/CdbDGQY0MKh8KuXIORy84Cune0MY5qj0W7Kj2Qs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tjr7SdDBr3+Fs5IbJYELFc574X1htZLZbpExQuJpDk6mlc5B3WtoRHftpc2AuN4jI
	 xquntxyf3Wx3YVhFUFadZRK2T/ZZIBkq38GU5TeMsAXqXcwyEAFvoj8SvpmmHK1a4D
	 o4U2lBqkVv1HLfl5so3xYsMVWLVHMKLUth3KVKM6KGPPAY/NBHXJy30Zyc8U34a1KE
	 k1GkM8ffZTFa6U1c5ldyoqgp0Gy8/UsZpsuO8Jqj7HjN/Ud9VjP1+NAgI6zSpV7qjG
	 vZZt+SxdpF0paX7sLwgIwnwZwCKwu3BvJfJqMBdSimzREinVNOGl7tUsnk/ZfhrOSU
	 hs20squu2pOCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71114380AA66;
	Thu, 30 Jan 2025 14:10:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/4] defconfig: drop RT_GROUP_SCHED=y
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173824624400.971083.13259437466133760961.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jan 2025 14:10:44 +0000
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
In-Reply-To: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 anup@brainfault.org, heinrich.schuchardt@canonical.com,
 chenhuacai@kernel.org, kernel@xen0n.name, ysato@users.sourceforge.jp,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, linux@armlinux.org.uk,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 rjui@broadcom.com, sbranden@broadcom.com, tony@atomide.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org, charlie@rivosinc.com, xry111@xry111.site,
 wahrenst@gmx.net, treding@nvidia.com

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 15 Jan 2025 04:41:19 +0800 you wrote:
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
> needs an RT budget assigned, otherwise the processes in it will not be able to
> get RT at all. The problem with RT group scheduling is that it requires the
> budget assigned but there's no way we could assign a default budget, since the
> values to assign are both upper and lower time limits, are absolute, and need to
> be sum up to < 1 for each individal cgroup. That means we cannot really come up
> with values that would work by default in the general case.[1]
> 
> [...]

Here is the summary with links:
  - [v4,1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
    https://git.kernel.org/riscv/c/26f2d6de4179
  - [v4,2/4] loongarch: defconfig: drop RT_GROUP_SCHED=y
    (no matching commit)
  - [v4,3/4] sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
    (no matching commit)
  - [v4,4/4] arm: defconfig: drop RT_GROUP_SCHED=y from bcm2835/tegra/omap2plus
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



