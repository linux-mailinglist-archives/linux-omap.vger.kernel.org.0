Return-Path: <linux-omap+bounces-3852-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97307AD6F38
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 13:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 998D118993BB
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 11:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E4E2F4326;
	Thu, 12 Jun 2025 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FobjXkpf"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8022F430B
	for <linux-omap@vger.kernel.org>; Thu, 12 Jun 2025 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749728380; cv=none; b=WFkfwznJD3XgaIlUUDaFI1lUKM6nGPe4LwvzTwum6JPizuxFpMKAi8F9hR5/nFvBEGf3lw9nQxTcoLduTyoE2zX2A8krxS40EdA4E79o/UR5WEk+XCCVAEfvQKekKBxwxzsjjcFvSIcAb6YG1LE9vndYTbVTe0ecf295n9aLo6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749728380; c=relaxed/simple;
	bh=czXIVD6xQjvC1tEbZIVsAxrEf357Wbyhje47vKPmNJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PSkHWwxo96BanPtVAIUCu5+/ZGDHu1TD600575jlEMWBDm6SlNXzoJj4+dz7zvDvzSj4cclgQQ0wY9gnobNGyNHUmcONfMAWpW/UMYABtMgfruAO3HbHAisDhdAvJL8bdQocTaoe8ZoiRXQbWG0nOPw0Xc0hYydZwBS0mCfKsyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FobjXkpf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso1223925e9.2
        for <linux-omap@vger.kernel.org>; Thu, 12 Jun 2025 04:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749728376; x=1750333176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BH9zpyyeQx03Xpt9F0YSvnLpGJjqpDHk0YVCL6WUMi0=;
        b=FobjXkpff1OC/6aLAkU+164UgetZbovzhE5f6ioENUEldH2P7mwyUMnNJNspXrgkLg
         hURsyNj+9N6M6u0qtcI51w4A7mL7x/D/LFal60ZgyPmwbDKf1TgXJFQIR7H4d3a4+3Ql
         KdBCz5NO8D0H5qFkhauCJytNuq+3qx15LB5lrcH6zR0syBPAkywGdwnpMvNbZwgcj3aU
         CVUMRFl+CWz0OiFiXI/G645wOaQXTRE/DBDMrR0AgiQ+Im4jqJ91z51Z4MHZaLFrvNtM
         kKW/6cUGAm6I7XDLanUpuiouWn/OMA3P1ntwq6wj7Qd74smZ6VjFqkanm6FiWSGk7p6N
         NTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749728376; x=1750333176;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BH9zpyyeQx03Xpt9F0YSvnLpGJjqpDHk0YVCL6WUMi0=;
        b=oQPbVEf5bBPa1kq9bC9MUOFJgg161M9yRigzL01Ncuqx/agmUggYf3iE1Snj2ekoKr
         cr/JVn0fh2WrQbHyo/ltDSB0VYtoWxHbqVyGJYAI7XIERlcexyCoxYOD1LoyFsUfBgEW
         +2a8QSvK0yGOoDpxXPz5VvpAqI2dY5y64MqF7ks9u7bMjknd6cNulAQWVHHMo9WEzKz1
         sE0rOHwwBHMvDRjXxdGSSAC1si2biWHrpigGL9U1SEKactZnjhCU1Y+WXJv0V30eXaxi
         Cc0x+/wkNJmmTZY+3r7Je2BM/J2fg6BFjWEDi6ZA5ZLJMW/we0m/nbbFL8Mi8yzS9QY5
         FE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxOU4VEAoinm+Gxox0/1zFxa+nLeJMMaBfBlDuxtz2za+r0wndJvd7Zbsk5PQFz9MrBS6zTT+Dy1YX@vger.kernel.org
X-Gm-Message-State: AOJu0YyeSlICMEwKcssqIVNS/q/SA2trM5j5ZwJq/Fkx19U+8NIYFtjr
	8qAUNbiODv0S/p/yRKvZvD73Q0BbmQ1semA/uzr+3LPnoo2+e638L6h7xNxC5gIO1adVP2qTNKV
	0e7/R
X-Gm-Gg: ASbGnctkTUezT9oNzlVPVqstS7Pcc3wjN9wTT8TcpLwmBAwxYyiaxtEu+v6qBwWlYnX
	rpb8B1DseP02eZWVdO4LoW0LB98YXK9MGsZMfNnNUJpVcXJrILXFWqHxea8sl63RJ23isg6EJOR
	Kw9C42jTEkc0sFhJ78aSPL7KjYL+C0aTVZUXbbETDyBJg2zXV5Cjtiq19P950FTbBLuEqj+znlK
	Lk6WxDEnz9phWbCnWI83B6Q+3LTk1dohsWfaFSlSt0zwyG4WPirQKikcrw3L0qY3dbMgpHrT307
	i3kX70wDTqG7yfT66qkec6AW6p43o717RQ3YlChB7toW4OII/3snTf4mbvoB2xrJPN1SyFAAH+l
	6lTn43nc=
X-Google-Smtp-Source: AGHT+IEcpObNjeWZdXRhh+Gz2mVKzNVAOuBcl9lUX8WtlsYJJ+gSEvmYwY5GXQOg2ReoFXO+QM0Mpg==
X-Received: by 2002:a05:6000:2313:b0:3a4:eeeb:7e79 with SMTP id ffacd0b85a97d-3a55881f23fmr2471607f8f.12.1749728376305;
        Thu, 12 Jun 2025 04:39:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3c763sm1750430f8f.62.2025.06.12.04.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 04:39:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, 
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-omap@vger.kernel.org
In-Reply-To: <20250611104348.192092-12-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-12-jirislaby@kernel.org>
Subject: Re: [PATCH] memory: Use dev_fwnode()
Message-Id: <174972837497.91877.6617168191559505764.b4-ty@linaro.org>
Date: Thu, 12 Jun 2025 13:39:34 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 11 Jun 2025 12:43:40 +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> 
> [...]

Applied, thanks!

[1/1] memory: Use dev_fwnode()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a0be20055d41028a121a5acc140e17c73d7541c5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


