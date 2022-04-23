Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB68A50C705
	for <lists+linux-omap@lfdr.de>; Sat, 23 Apr 2022 05:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbiDWDtl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 22 Apr 2022 23:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbiDWDtk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 22 Apr 2022 23:49:40 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B6A139779
        for <linux-omap@vger.kernel.org>; Fri, 22 Apr 2022 20:46:44 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id w27-20020a056830061b00b00604cde931a0so6840469oti.2
        for <linux-omap@vger.kernel.org>; Fri, 22 Apr 2022 20:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BnZnnoT6u17cMBvx4fLrAZ3WsP2xWB5sk2X09H1CnDM=;
        b=hdTEjnuZv9XtGnNhGZKUquL17GQijJsYQqWg99mOafGfcpkcY7UFB7rvtA9sJicnJC
         ZM74JKgQ7x5wYNJDeOUNh/oQeSQi1sSfeDTYs0OvgcIp0DlR/BgXYsuEqPRdabYHUxd7
         6o6HSTvwC/+uNc0cymZp2rTHZK+t7Q1JDda3I8CP16wR7cV8zd6r4eIpCBacshtd5nHw
         25DW6p5aCAyX0DjDvFgRqYyqmeN++2xUikOEIOuefdSSlzsx8DYVg2l+G3Rl5IN6YoZG
         Q5mO4tErVF0BtNV4i7zkbNbvtvLmONq7ZDPs+M+O5524WPG3cYDxgCwwsyJ2zrqSygF4
         DM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BnZnnoT6u17cMBvx4fLrAZ3WsP2xWB5sk2X09H1CnDM=;
        b=6dmWY77xV8Bkdp4l1lrPaHKwXJIaoNwD0caNiZIYoBUoxH/GbG1TjnUAZ0xn6zlK/x
         uLaCXlaypnR69e8qaE6c8bMgbiiV8hnwPKFNFXySfJI4oP7VJ8eWTWNKrXtDcyf6lE90
         FMoGbL3LtYO9L+jTKdoqG+K6CqrWPounzZbHbVba+vjFO0C2KyfAs/GXoQJGYhjuvdSv
         dDzf0QewxB1UtGVXMCS8nW8CRO36FiWJStT8lO6qbvKeMbt7WJeGlNOSHk/q5Dz/pJsw
         E8T9WtDTPExBB86DM/dvlmhjqfA0ToTd8PtfQ88YpGBHZpf1OtjxghTSpc6LV2Vu3FBu
         h9nw==
X-Gm-Message-State: AOAM532GDXWxliKhBFheQkC7oMBstm21A/WbkIjXn4Isdj0uOAy4DAiW
        dtK9epa0fD3cc55XtY5wXmrhkA==
X-Google-Smtp-Source: ABdhPJwNVlkRU9XfjQyZohjuLbvkF4wXDGfF5G/QoCISRFssL20unlfXkit1hpSKB2GRWTcmCn0aLQ==
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id 5-20020a9d0b85000000b005cb3eebd188mr2999911oth.77.1650685604127;
        Fri, 22 Apr 2022 20:46:44 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id b188-20020aca34c5000000b002da579c994dsm1440218oia.31.2022.04.22.20.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 20:46:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     cgel.zte@gmail.com, ohad@wizery.com
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
        Minghao Chi <chi.minghao@zte.com.cn>
Subject: Re: (subset) [PATCH] hwspinlock: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
Date:   Fri, 22 Apr 2022 22:46:40 -0500
Message-Id: <165068558593.2759280.12864119040707530948.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220418105508.2558696-1-chi.minghao@zte.com.cn>
References: <20220418105508.2558696-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 18 Apr 2022 10:55:08 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> 

Applied, thanks!

[1/1] hwspinlock: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      commit: 0e01d176d5788f66dc64a7e61119edb56eb08339

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
