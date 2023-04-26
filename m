Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 702106EED03
	for <lists+linux-omap@lfdr.de>; Wed, 26 Apr 2023 06:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239394AbjDZEmx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Apr 2023 00:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239400AbjDZEmu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Apr 2023 00:42:50 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE7626BE
        for <linux-omap@vger.kernel.org>; Tue, 25 Apr 2023 21:42:48 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id 006d021491bc7-546ef028d62so4167294eaf.1
        for <linux-omap@vger.kernel.org>; Tue, 25 Apr 2023 21:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682484168; x=1685076168;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEkw1KmmzfmMdZjy2G/k2kJ9Rp06l3CUoffIihDDUro=;
        b=ahJMIWTh5hWsknwjxsHnHQo9L9VjzYcn1k/0nU23PU9uEZU8NalnBK3f9aVgzZCo5r
         +p006FX/ZwqMvKSjA6VHEj3uIqzR993g9P1CrFK9Fivzgwmca8kxjeyWkyvWkLEi20By
         rct6ZAMuikhMKj/3DXx5AKfXigvurLbq4PilgTtzLaX/aYV2jyLFb01f0/lE77UE8BOc
         ML+1/nS9zkVDTQXcJNJoyM+er+SvJwqMhIgEhQBdEjVaUbzrCEWRuqiCz7c6sMP2L2E+
         MlXEZJFcfRL02s5L4RO1N8I6SOXxlWfGIeqLuoo5V3O7DfHscz5K73m9EKR1oRzUmK1z
         5l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682484168; x=1685076168;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JEkw1KmmzfmMdZjy2G/k2kJ9Rp06l3CUoffIihDDUro=;
        b=O6LXP2Wuq5IlxDMUopHA6gicJE+ykXdDxmCMmlw1lpZTAWgucs80Eyt0pdLRjdPkNY
         y5zuqYmf++qHeu4PpcbU4uldolmYbSGpSdGRWWimAapjAGGFf/jOxPPpjXtKxy30xDFg
         clrIGBdgBjfI3mNNrWMz/zAd5ExtZ9HermqdAWiCKo1NuyE+m4dWVFkxSKdCnYNRVHzI
         W2dI6NebwADATiU9rlTCeWK3g5XryLBxEEMwRugNHuZrDChcGBmi6JOBU7mMKVAyBehv
         qPKz226sd//8WZ6SJwNCBNRMQnRCYg2huKcO20WPZls/NnEmerNnGDG4S4QZwPalK+u8
         CKyQ==
X-Gm-Message-State: AAQBX9fz3biCUwwP75XWB5VrZT8n2F56/CgfsRA02fiQ+rHboGAEskw+
        sbL/ikMIPnfqdevVDxYdXqfyKj7rWmVx066F/nU=
X-Google-Smtp-Source: AKy350bOLIyI+w9KrBjo8wnTDAYvlhBLAGs13pccFIMH9r8rI9git9fbIly8hLQTWzX3A/fyOGsGfQkHlyrIgnqmVnc=
X-Received: by 2002:a05:6808:1885:b0:38b:6c2c:3168 with SMTP id
 bi5-20020a056808188500b0038b6c2c3168mr10879839oib.35.1682484167861; Tue, 25
 Apr 2023 21:42:47 -0700 (PDT)
MIME-Version: 1.0
Sender: mrs.nicolemarois555@gmail.com
Received: by 2002:a05:6850:190d:b0:472:4a8e:9aa6 with HTTP; Tue, 25 Apr 2023
 21:42:47 -0700 (PDT)
From:   AVA SMITH <avasmith1181@gmail.com>
Date:   Wed, 26 Apr 2023 04:42:47 +0000
X-Google-Sender-Auth: oLN8TkQTeeK3qe33xEXBWukGFxo
Message-ID: <CANiD9SJaRynGGmJb2Z8thdK8fg7qLtPr09Js5yoCTSpw2g-c1Q@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,
My name is Dr Ava Smith,a medical doctor from United States.I have
Dual citizenship which is English and French.I will share more details
about me as soon as i get a response from you.

Thanks
Ava
