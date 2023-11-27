Return-Path: <linux-omap+bounces-32-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6197FA6B8
	for <lists+linux-omap@lfdr.de>; Mon, 27 Nov 2023 17:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C97002819D8
	for <lists+linux-omap@lfdr.de>; Mon, 27 Nov 2023 16:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6CE328D7;
	Mon, 27 Nov 2023 16:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBnRn0ns"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A2919B
	for <linux-omap@vger.kernel.org>; Mon, 27 Nov 2023 08:44:39 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cfc2bcffc7so10532725ad.1
        for <linux-omap@vger.kernel.org>; Mon, 27 Nov 2023 08:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701103478; x=1701708278; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tZa3+EBPmr3IlMEtKh+TLvpIfzmfFEGfUJ7ow8nZ+Jo=;
        b=hBnRn0ns2sC9NE2sIARqPvCdMUGitYo6BeclkVq+SuZ4GfCQzk6phG6pfkCSQ9oVbz
         nnsHXygUa3lVSIqWHn0/vAypFRKXtzzLW5O31khOozmfX+EFM80PT4htyZaRdOSuNfQM
         FXKNMRjZXoKToM4ZfRJmNehXp0CbTxtjVAvtZFM+ZIsc4OIb/khQ0TNtWdbEaJeEPqgD
         rwC2oDwGKR3E98j5H7iB1iODBrOgH7ft6eRcHltommDBaYsm5viUjwVPmc++2ICbNyGj
         ZJQIzpoZregabEOVk2b7jT7Mu5TZrt2lFN+95a6dWP0XBbSxzSEGHsTtGSkyQR/VvmYK
         BePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701103478; x=1701708278;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZa3+EBPmr3IlMEtKh+TLvpIfzmfFEGfUJ7ow8nZ+Jo=;
        b=cYgEbUYVcr30moMRcD84snnO4wfbjOKFejBlkPkOtJmPo025VxNAIF2DVsV/MkGH9O
         +8iU2ll/JOHUj/brL0OAH+7kbe/wNlqcvr8hKJfiMzODhvkM8sQzP0Yn7HgicRUzVoA9
         HsfcxvsrCVEAQ3fTyeV7w0ZK2nVg7X1Or0OvKK1Xu7iWPvz2gpFluotLPYDZTw84nsph
         lXYknZTa6G8tmJkfWzZB1cgiR1OeKDmWduZE+to85YGlhmOZ5XItGnX1xNro9HvVkx/I
         i69fdjo57Ng5CFBCjDU62RClpqiAPOWX+K32EMAq8Xi5uZSHw2dHkC804ZjHR1usSzC9
         vdjg==
X-Gm-Message-State: AOJu0YwMXSIiQ2go/lZEgigM+tk7IN8F8YKrmgkTUtW+GhhqEHKI0ruj
	qlAkiEG9qB8h+PFKjqwALDJQDkT3cL0=
X-Google-Smtp-Source: AGHT+IGc1m1jLTgwz+YVsolH/3eiLwwcEl0mynAPdMMT7EJzrLiknT4ZbSTfI64oD5JSSOjSRw0X3A==
X-Received: by 2002:a17:902:e5ce:b0:1cf:c518:fa6f with SMTP id u14-20020a170902e5ce00b001cfc518fa6fmr5446513plf.16.1701103478158;
        Mon, 27 Nov 2023 08:44:38 -0800 (PST)
Received: from DESKTOP-6F6Q0LF (static-host119-30-85-97.link.net.pk. [119.30.85.97])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902bf4b00b001c61073b076sm8405104pls.144.2023.11.27.08.44.36
        for <linux-omap@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 27 Nov 2023 08:44:37 -0800 (PST)
Message-ID: <6564c775.170a0220.bca4d.3bbc@mx.google.com>
Date: Mon, 27 Nov 2023 08:44:37 -0800 (PST)
X-Google-Original-Date: 27 Nov 2023 11:44:35 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: alvaroenoch632@gmail.com
To: linux-omap@vger.kernel.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Level: ***

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AAlvaro Enoch			=0D=0ADreamland Estimation, LLC


