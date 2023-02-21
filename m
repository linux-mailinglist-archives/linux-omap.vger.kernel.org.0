Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0A369E2D0
	for <lists+linux-omap@lfdr.de>; Tue, 21 Feb 2023 15:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjBUO6a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Feb 2023 09:58:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbjBUO63 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Feb 2023 09:58:29 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594412716
        for <linux-omap@vger.kernel.org>; Tue, 21 Feb 2023 06:58:28 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id c12so4748679wrw.1
        for <linux-omap@vger.kernel.org>; Tue, 21 Feb 2023 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYgal4JxSeqClDjOaTIWuG632pDj7jRjSVKH768J0cA=;
        b=TGh5xl8rpn3JBIZPQ6YTzAdRKMNcEvhNyEIaOarkFd1ahX5ZPcygayr7O5eyZYL4bb
         ZerP4Kf3GFvmtFR6L56ATsN4lhAjmfVORFBmzDPsfXFULj7R6XnQDurCByvZAYrtfM/0
         T6ecPLNbINYIWbmZUK6GKa73mgJfmuzfyFwNXxRJIBJpc/77ccV/xyheaZRQWAUOcpFP
         qV1Rb2PRZasG2QnattzpPUHmBUlXYwvVYni+zMrzBy3bbtWtvkpI5Qw6CoiT6pAZukyR
         6FDi3xMGqfQLoVKpLTXZr3mdez5gmUwmwrv3ka08+x6uw6ZxF273mQ+LqkzAO6JBQvvX
         2mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYgal4JxSeqClDjOaTIWuG632pDj7jRjSVKH768J0cA=;
        b=tBMJYT1K/lhtmiEe7KEQkCodwQEyjHPKGU9I7XTzMJ3OuRa/sU16pAI+E/+MQXkdJl
         lzTOXLrBTqNyX/NqMrMqOs+wB8ukE5VDFMjwkyy1EQ8bunf3sh+lkwVT/XMN2wQjAAx+
         4a4wx2Z04I5LZfXKiSIurM36mI3zVQSaGcLeKdVwr3gwTZahCv5e/JFB3hUF43qMMvX7
         +vf8Og831fek0I8LXclqA25/E2QzpnqSRIuqmdIV8OYBh+EOkcLjW0qYF2rNppgIwnh5
         tTnCamRghZJiNtiAXXbp1Q07nvGFgYFNbw2ldma8Q6/kxMNzdRz64HOsGhTyqeBtrNRC
         2d9w==
X-Gm-Message-State: AO0yUKWxxsTHyDSgfnU1z6bM+tylwy6hh9L4Ne8dcRII8u5VEj8R64XG
        RzwrMZlk+/lfTMeeG7KgTuzbdnaFGg==
X-Google-Smtp-Source: AK7set+XHzot2cziDjBR97QJgiPM2up9F76NnV8fVWLtWJ40PdVMVJqrGHAWETuyYMj1xc4oGGcM3Q==
X-Received: by 2002:adf:e811:0:b0:2c5:61ef:7b37 with SMTP id o17-20020adfe811000000b002c561ef7b37mr5061651wrm.10.1676991506572;
        Tue, 21 Feb 2023 06:58:26 -0800 (PST)
Received: from DESKTOP-L1U6HLH ([39.42.138.70])
        by smtp.gmail.com with ESMTPSA id l3-20020a1ced03000000b003dd1bd66e0dsm2242447wmh.3.2023.02.21.06.58.25
        for <linux-omap@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 21 Feb 2023 06:58:26 -0800 (PST)
Message-ID: <63f4dc12.1c0a0220.cebe0.67a5@mx.google.com>
Date:   Tue, 21 Feb 2023 06:58:26 -0800 (PST)
X-Google-Original-Date: 21 Feb 2023 09:58:27 -0500
MIME-Version: 1.0
From:   butler.dreamlandestimation@gmail.com
To:     linux-omap@vger.kernel.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,=0D=0A=0D=0AIn case you really want take-offs for a developmen=
t project, we ought to be your consultancy of decision. Reach out=
 to us assuming that you have any undertakings for departure whic=
h could utilize our administrations.=0D=0A=0D=0ASend over the pla=
ns and notice the exact extent of work you need us to assess.=0D=0A=
We will hit you up with a statement on our administration charges=
 and turnaround time.=0D=0AIn case you endorse that individual st=
atement then we will continue further with the gauge.=0D=0A=0D=0A=
For a superior comprehension of our work, go ahead and ask us que=
stions .=0D=0A=0D=0AKind Regards=0D=0AButler Alexis	=0D=0ADreamla=
nd Estimation, LLC

