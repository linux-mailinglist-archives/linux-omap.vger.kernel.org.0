Return-Path: <linux-omap+bounces-2502-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E84379B526B
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 20:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACBD2283C43
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 19:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE289206E92;
	Tue, 29 Oct 2024 19:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VayZLpSy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB64B1E0B93;
	Tue, 29 Oct 2024 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730228934; cv=none; b=ClpAV0kPZA1U/KVj1ieiFgcOH4CLIw9HcXEhNZBF1Bls99hsPu4ib+AHRiJQHOMCH3P8J4WWvkrSu3W98YjDPWurV1y29NeRxB8kD5mRChXbHkiP5YUfyM6qiBU/KgLudSbtHbdW/vIEOOLHH5D+VABJ1okqDHNC1ZrQICQ+fWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730228934; c=relaxed/simple;
	bh=tIfGwD/HdO/jnrrCromSFeH1ke0AevLnE2PgsP2rc6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrwJw18v9x0u80fMVC7CvGb6Fqxh/EEhgDrhDYGU/QBz0lMGveHmIOB6e9At8CYiCKpTbGilNxYfuUBGFbVfls7cK4Pxq9FyTTVGKA+6R7xCSH/qDmNta9YrjezefSFdWtGg3i7tbrvgutqhcJ2ebZX4vfQ1FpWXcrhZaHVnW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VayZLpSy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20cbcd71012so62634325ad.3;
        Tue, 29 Oct 2024 12:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730228932; x=1730833732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIfGwD/HdO/jnrrCromSFeH1ke0AevLnE2PgsP2rc6w=;
        b=VayZLpSyehjVIm1LwX/JA4IFEGyv8jWBvMxG72euyzVtPZOUSRbtPYdcoZHR1PnHn3
         rIZoQc8pcGcP3/E9bKyjuc7tOcbRIg68EGaVPFzZPaS9HlOU7KW0H1cDgFen8oDfglDp
         7fkaSiBAS3SDcH+n/4HKsFQmAW9WlJpqnIRkfe2I6ajFZik8EE7A7HDHAIUqhqsBp5KV
         Aq6GcC9uLNmMMYvluav+MwvsqadG/e/lUoyxocW/GXYkFdpst1gaCGqwCR/OKrp0gcQp
         6Qn751G/zVdgD9QKtLNYD28tnJ9CPWchy3jyFAZdelU3kvOwLrfLWLUHUTj8iCHo+l8Y
         GJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228932; x=1730833732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIfGwD/HdO/jnrrCromSFeH1ke0AevLnE2PgsP2rc6w=;
        b=fAu8TruAi2YaT9GXir9n8ylVeBGIF5WH1NFNmN/eQ55EsAMAv+pG0TRguYejhupLuz
         4p8Rky/7d0iqeODHxLNQpgkuduTTe9mV/ZBR7Fpv990shAmIDT1MNEs+S2YXGcPTGF8i
         qP3vQJPzT4MAUMWYzqCKykLP6irKE3HAEXKq2OwDLp9kywnPSdEdvUBY8pFx62e0qQRI
         G708z7bosb13HxzedzkB34yP0OJkCckgri/P7u39vfiVvrzYT5ws/BkwBAgeZXi0LJQx
         qkqP1W9EC2ZatpyfAI5GvBLN5VgyBHoiIJ4FKkI+8nmVE3MuSWCO41r4rVaqzlZOafvd
         hjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH+C4jDiPiiQkO+cWa9d9i4peqY9zy+n2AdFEg2NyB4Xo9wU+L0V9PPFnPh54di+SFr9JBgTxAAJ5czA==@vger.kernel.org, AJvYcCV9pF3lQgOUlZijAOG7obW6Y3jer3QYUl5ue4zYTFkGLJ1TJwR1TlkzDTE3Pv89ZdGwUklb1ftwzaVx@vger.kernel.org, AJvYcCXMMVoHAXl8rsWM2949YXut72M6saZ3ThipQx/2oPUa+Me9BOPeEqLGDVSWIqoXezpCTXRaQXmAGlHS7ZGc@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMFY+IG4V1H7EMGQWtN8WX2s/oDGmlB7XOkDLxw+k7bEGUzz1
	cRmnu1bEYwZBPKQE4cSZZzRiF17aGjmr1rQS20wbk7xX+FpFhgvv
X-Google-Smtp-Source: AGHT+IFQ4p5UFgCpOtHK7NrcYjknJvrx7h8QNzPleJb/62ppRwEmYxJQFe2k/57b5BUSrupD/3lbDw==
X-Received: by 2002:a17:902:d4c7:b0:20b:4875:2c51 with SMTP id d9443c01a7336-210c6c01a6cmr151731295ad.27.1730228932088;
        Tue, 29 Oct 2024 12:08:52 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc089668sm69591265ad.308.2024.10.29.12.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:08:51 -0700 (PDT)
From: MightyM17 <bavishimithil@gmail.com>
To: bavishimithil@gmail.com
Cc: andreas@kemnade.info,
	bcousson@baylibre.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	robh@kernel.org,
	tony@atomide.com
Subject: Re: [PATCH v2] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Date: Tue, 29 Oct 2024 19:08:44 +0000
Message-ID: <20241029190844.791-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626095056.12607-1-bavishimithil@gmail.com>
References: <20240626095056.12607-1-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello, is there anything blocking this? Previous problems have been mentioned in this v2 patch, any further reviews?

Best Regards,
Mithil

