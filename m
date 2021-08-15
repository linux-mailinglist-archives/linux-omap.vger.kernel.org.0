Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB3B3ECA9F
	for <lists+linux-omap@lfdr.de>; Sun, 15 Aug 2021 21:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhHOTTs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Aug 2021 15:19:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:37276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229502AbhHOTTs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 15 Aug 2021 15:19:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AD8E61154;
        Sun, 15 Aug 2021 19:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629055157;
        bh=vFri3/vXIMu02ObBTeiWGSxtmvcRFA1HLVO3vsc45Uo=;
        h=From:To:Cc:Subject:Date:From;
        b=R3Fz3fI06WiXuvz6BdkbGqVmg1oik6J4Qhk9Y/hlqcLzLpiegq0vaQVd1J7eSEseT
         v0x5hXegX5+ogxsLRVuRxA+6f/eRsGkC3/jONuQ10qKwJ/4VzJZ1i+LYmO9d2IMkif
         DANOLsN/IYYyeA61tuFal3drKrLlFhfJWIMeQtXtDJHY3lebkjCD+LDgEPb8z7nUbh
         8BR/1Q3RJkiWa4jPC4SKHpsfHttuk+3ZlGBIvYNNGIYj4HnFHdRJNDKxXXSsvQLF1N
         7sdoGMqODodWjfrTRTPR7SY3wE10WhG9OefS1TwP+VtE58y1ch4qsgPz5kTuwbtLyG
         O3FDP1uWKXhtQ==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] bus: ti-sysc: Add break in switch statement in sysc_init_soc()
Date:   Sun, 15 Aug 2021 12:18:52 -0700
Message-Id: <20210815191852.52271-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

After commit a6d90e9f2232 ("bus: ti-sysc: AM3: RNG is GP only"), clang
with -Wimplicit-fallthrough enabled warns:

drivers/bus/ti-sysc.c:2958:3: warning: unannotated fall-through between
switch labels [-Wimplicit-fallthrough]
                default:
                ^
drivers/bus/ti-sysc.c:2958:3: note: insert 'break;' to avoid
fall-through
                default:
                ^
                break;
1 warning generated.

Clang's version of this warning is a little bit more pedantic than
GCC's. Add the missing break to satisfy it to match what has been done
all over the kernel tree.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/bus/ti-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 0ef98e3ba341..afe8222db7cd 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -2955,6 +2955,7 @@ static int sysc_init_soc(struct sysc *ddata)
 			break;
 		case SOC_AM3:
 			sysc_add_disabled(0x48310000);  /* rng */
+			break;
 		default:
 			break;
 		}

base-commit: ba31f97d43be41ca99ab72a6131d7c226306865f
-- 
2.33.0.rc2

