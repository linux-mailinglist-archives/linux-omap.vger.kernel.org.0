Return-Path: <linux-omap+bounces-4841-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40451C33550
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 00:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCA484F0951
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 23:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E692DF6F4;
	Tue,  4 Nov 2025 23:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="B27jY6R6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B73155CB3
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 23:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297617; cv=none; b=LvLlo14VVvgDtVZYMoe+gbOtMoG3S4qZjS/+CMLPvNkB1l9sbaaHTx4CNs6OwUkrGZaKnP+STzUFdGHEZASk1e9bVU6jVMN/lSEdAu+F9MGJ7SdoAoNw/opHEizzHPTvf4nWQFFe52gy/uWajQUWFU8onDIl40mZKx9t3CXMSsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297617; c=relaxed/simple;
	bh=o0lERfDqZZmSF/06he2+TViPlwdqyRxyBBlFXX1LsAQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gmWy9VkAOgn1XlX/6wYU80jy6BefHtmtiPirEv8RScQGa4AD/zqx02p1aNp9+SplrbJitcRQA23UmluThSrYI6S/eiTw3SQR1RBXxT3pH0idnEru9+wwfSSQJiwTFAGh9etu9vN2Px7U4/V2L8ih+W9YSAES9r3f5l489plqStk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=B27jY6R6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso2640232b3a.3
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 15:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297615; x=1762902415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJFAZEOG08NV6dkrMYInxAtkqPNikQNRUGaYW7hTz1s=;
        b=B27jY6R6jQSGmPf0otpHY8P64wTH/9W2zvc+H9LXdPc/y1GoIowaDQ0rhUOBMgjEYF
         B+CA52gky/CzrvRZgTYW/Lj9ikQPXYqPU7BxAPaKuNyIuJSPm5JvNs4l3UofjNYcxw6u
         NzAYL0ONg1vNCTljgCvhuk8MBayewO/z4eTZV9TMaTjSrEaKvNXM3esanLL66TKsgJxH
         XJRCPW2Cw5NTN2rHRrLCdWWvRCKG2Mrs6hKsU8lxszJou3ne8vW9nRTYmcVW6M037j7q
         Aoj2vyRZ/5Cal2WJNyatHazthuxrftHLnko5r59Cf/BcHX1Gx3A44anV5EZ0NhrO5f3e
         50wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297615; x=1762902415;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJFAZEOG08NV6dkrMYInxAtkqPNikQNRUGaYW7hTz1s=;
        b=S51aXWchukzcogbqVmpHYq2H5p+sH+Vi7iSZrZ45ORYKfLuw+w1fYZzPvdEoHxdt+m
         O5easbt4nvWCeIwKh0a9Gf2xEDOEPIYWFLYE7vcifOxJ24uLURzep4qDYXvtx7IVmnK7
         El3BDwSmbxDANeVMVNDEM6gieuDiTHoCcJogBTmw8RVO9mDE+EwBfJQ8IGxH+g0bnt8a
         Y/zVfv8GkHtxDkcM8GGTlgH4iwt01R3PYCM8eoH/Lg40tqN8S2fy9xzqeCgQDCR52oZi
         eQG4wpJfnnSTMY0pqCiHxVE/BmwV4CZxROhu1AtvIGdoFEEsVfiif0YtJFSZfXmvY5z5
         dvrQ==
X-Gm-Message-State: AOJu0YzXJ3s4yqg7p/VXui1CgZ12qpP2Q8rjKQLofLU55jfRI48xRT2d
	rR8IP1qidgyUt3UKEop+IC7yBVhCExN+d2psr9YTzJwZctJOcNNNHoDWmkoDxRLhCac=
X-Gm-Gg: ASbGncuc/93gVi65B2ihd1F8jakyV4UUJzQ8Ml9r8KUK+KGX9EZtUl2wJFiA7XZVvwR
	ViGEJyfFqLjoQlllsqzyJGOcXXhIxPblQ1edDxYyFEXaPpOnkjN2MderkXvLDHYacdPzpXBdG3a
	eSdMCESN3YS5IT3fr8F4G6THZ3LOcvAiexJ5xPgqLHrpaj4WUT/Wo5LVTvBAysH8TPeGn+3txQx
	sDaDJ0paCl7n5tzMdHHoVguHeMpEKo7V41zc7T3y3WxH5lYXPPQaFgakDjfal6im5vJrKqwQrec
	ma4ek3LFEqa4ScZ9YdoTcnCFhfdrp3q4qKI2efB4odAVRvkcBhnHMp3Lnnyfzzx9MOevDdfxbk4
	NArA+l+CrfhwjELtnlvfhAbGXPGd+18P/AMv40+myA1gb9L9QyLBmvRsVcGAuiEP0vFZ072jEqQ
	==
X-Google-Smtp-Source: AGHT+IF1ud2bMIErNJPVPbuNsgZ8rFjola/1vzbK/eKTQ5y1kT9m/5+6Fg8hQ5RI56t8aa3m2gjGiA==
X-Received: by 2002:a05:6a00:8d2:b0:7a2:8308:3c8b with SMTP id d2e1a72fcca58-7ae1cc60936mr1190980b3a.10.1762297615299;
        Tue, 04 Nov 2025 15:06:55 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd079276asm4202444b3a.0.2025.11.04.15.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:06:54 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: devicetree@vger.kernel.org, yegorslists@googlemail.com
Cc: linux-omap@vger.kernel.org, tony@atomide.com, robh@kernel.org
In-Reply-To: <20251007103851.3765678-1-yegorslists@googlemail.com>
References: <20251007103851.3765678-1-yegorslists@googlemail.com>
Subject: Re: [PATCH] ARM: dts: am335x-netcom-plus-2xx: add missing GPIO
 labels
Message-Id: <176229761444.2840692.8897118152236027806.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:06:54 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Tue, 07 Oct 2025 12:38:51 +0200, yegorslists@googlemail.com wrote:
> Fixes: 8e9d75fd2ec2 ("ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 2-port devices")
> 
> 

Applied, thanks!

[1/1] ARM: dts: am335x-netcom-plus-2xx: add missing GPIO labels
      commit: d0c4b1723c419a18cb434903c7754954ecb51d35

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


